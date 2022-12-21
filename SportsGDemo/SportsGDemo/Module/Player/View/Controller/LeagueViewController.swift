//
//  LeagueViewController.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import UIKit

class LeagueViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel:LeagueViewModel = LeagueViewModel()
    var objectArray = [Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.title = "League Details"
        tableView.delegate = self
        tableView.dataSource = self
        self.getMatchDetailFromAPI()
    }

    func getMatchDetailFromAPI(){
        
        viewModel.fetchAllSportsDetail { [self] data, success in
            if success == true {
                print("Success")
                let spArr = viewModel.sportDetailArray
                for i in spArr.enumerated() {
                    print(i.element)
                    
                    for (key,Value) in i.element {
                        objectArray.append(key)

                    }

                }
            
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{
                print("API error")
            }
        }
        
        
    }
}
extension LeagueViewController :UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueCell
        cell.nameLabel.text = objectArray[indexPath.row] as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
