//
//  HomeViewModel.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import Foundation

class HomeViewModel: NSObject {
    
    var sportsService :WebService!
    var sportArray2:[String:AnyObject] = [:]
    var matchCategoryArray = [Any]()

    
    var sportsData :[ALLMatchDetail]! {
        didSet{
            self.bindSportsData()
        }
    }
    
    var connectionError:String! {
        didSet{
            self.bindingConnectionError()
        }
    }
    
    var dataError:Bool!{
        didSet{
            self.bindingDataError()
        }
    }
    
    var bindSportsData : (()->()) = {}
    var bindingConnectionError : (()->()) = {}
    var bindingDataError : (()->()) = {}
    
    override init() {
        super.init()
        self.sportsService = WebService()
        // self.fetchSportsData()
    }
    
    func fetchSportsData(completion: @escaping (ALLMatchDetail?,Bool) -> ()) {
        
        sportsService.GET(url: URLs.allSports, params: ["":""], httpHeader: .application_json) { [weak self] success, response in
           // Innings Notes key    String    "Innings"    key    String    "Matchdetail"    key    String    "Teams"    key    String    "Nuggets"    key    String    "Notes"    
            
            if success == true{
                
                do {
                    let json = try JSONSerialization.jsonObject(with: response!,options: .mutableContainers) as! [String:Any]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: json,options: [])
                    do {
                        let decodedData = try JSONDecoder().decode(ALLMatchDetail.self, from: jsonData)
                        
                        if let dataInfo = json["Matchdetail"]  {
                            self?.sportArray2 = dataInfo as! [String:AnyObject]
                        }
                        for (key,_) in json{
                            print(key)
                            self?.matchCategoryArray.append(key)
                        }
                        
                        completion(decodedData,true)
                    }catch{
                        completion(nil,false)
                        
                    }
                    
                } catch {
                    completion(nil,false)
                    
                }
                
            }
            else{
                completion(nil,false)
                
            }
        }
    }
    
    
}





