//
//  MainViewController.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 21/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel:HomeViewModel = HomeViewModel()
    var getCategoryArray = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Match Category"
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        print(viewModel.matchCategoryArray.count)
    }
    
}

extension MainViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource

{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  getCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionCell", for: indexPath) as! MainCollectionCell
        cell.categoryNameLabel.text =  getCategoryArray[indexPath.row] as? String
        cell.mainView.layer.cornerRadius = 8
        cell.mainView.layer.borderColor = UIColor.systemTeal.cgColor
        cell.mainView.layer.borderWidth = 1.0
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.size.width - 40 , height: 160)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
