//
//  HomeViewController.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import UIKit
import SDWebImage
import ProgressHUD

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var homeTableView: UITableView!
    
    var viewModel:HomeViewModel = HomeViewModel()
    
    var objectArray = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Match Detail"
        self.tabBarController?.tabBar.isHidden = true

        homeTableView.delegate = self
        homeTableView.dataSource = self
        getMatchDetailFromAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let menuButtonImage = UIImage(systemName: "plus")
        let menuButton = UIBarButtonItem(image: menuButtonImage, style: .plain, target: self, action: #selector(didTapMenuButton))
        navigationItem.rightBarButtonItem = menuButton
    }

    @objc public func didTapMenuButton() {
        let second :MainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        second.getCategoryArray = viewModel.matchCategoryArray
        
        self.navigationController?.pushViewController(second, animated: true)
        
        
        //performSegue(withIdentifier: "segueToMainScreen", sender: self)
    }
    
    
    

    func getMatchDetailFromAPI(){
        
        viewModel.fetchSportsData { [self] data, success in
            if success == true {
                print("Success\(viewModel.matchCategoryArray)")
                
                
                
                let spArr = viewModel.sportArray2
                
                for (key,value) in spArr {
                    print("\(key), -> \(value)")
                   // let val = "\(key), -> \(value)"
                    objectArray.append(key)
                }
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
            }else{
                print("API error")
            }
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.nameLabel.text = objectArray[indexPath.row] as? String
        cell.mainView.layer.cornerRadius = 8
        cell.mainView.layer.borderColor = UIColor.systemTeal.cgColor
        cell.mainView.layer.borderWidth = 0.5

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let second :LeagueViewController = (self.storyboard?.instantiateViewController(withIdentifier: "LeagueViewController")) as! LeagueViewController
//        //second.strSport = sportsArr[indexPath.row].strSport
//        self.navigationController?.pushViewController(second, animated: true)
        performSegue(withIdentifier: "goToLeagueScreen", sender: Any?.self)
        
        
    }

}


//segueToMainScreen
