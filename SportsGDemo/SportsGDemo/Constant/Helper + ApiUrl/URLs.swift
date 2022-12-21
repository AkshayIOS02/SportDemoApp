//
//  URLs.swift
//  SportsGDemo
//
//  Created by Akshay Sharma on 19/12/22.
//

import Foundation
import UIKit
struct URLs {
        
    static let allSports =  "https://demo.sportz.io/nzin01312019187360.json"
        
    static let allLeaguesurl = "https://demo.sportz.io/sapk01222019186652.json"
}


func connectionIssue() -> UIAlertController{
    let alert = UIAlertController(title: "Connection Issue", message: "an Error Occured, Please Try again!", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    alert.addAction(ok)
    return alert
}
