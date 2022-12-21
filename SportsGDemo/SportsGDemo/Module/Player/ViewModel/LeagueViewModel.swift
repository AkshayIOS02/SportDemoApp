//
//  LeagueViewModel.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import Foundation

class LeagueViewModel: NSObject {
    
    var leaguesportsService :WebService!
    
    //var sportDetailArray:[String:AnyObject] = [:]
    var sportDetailArray: [[String:Any]] = [[:]]

    var matchCategoryArray = [Any]()

    override init() {
        super.init()
        self.leaguesportsService = WebService()
    }
    
    func fetchAllSportsDetail(completion: @escaping (AllMatchDetail2?,Bool) -> ()) {
        
        leaguesportsService.GET(url: URLs.allLeaguesurl, params: ["":""], httpHeader: .application_json) { [weak self] success, response in

            if success == true{
                
                do {
                    let json = try JSONSerialization.jsonObject(with: response!,options: .mutableContainers) as! [String:Any]
                    
                    let jsonData = try JSONSerialization.data(withJSONObject: json,options: [])
                    do {
                        let decodedData = try JSONDecoder().decode(AllMatchDetail2.self, from: jsonData)

                        if let dataInfo = json["Innings"]  {
                            self?.sportDetailArray = (dataInfo as? [[String:Any]])!
                            
                       
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





