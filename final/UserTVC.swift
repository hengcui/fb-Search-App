//
//  UserTVC.swift
//  final
//
//  Created by heng cui on 2017/4/26.
//  Copyright © 2017年 heng cui. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SwiftSpinner



class UserTVC: UITableViewController {
    
    var data:JSON = []
    
    
    
    @IBOutlet weak var back: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        back.target = self.revealViewController()
        back.action = #selector(SWRevealViewController.revealToggle(_:))
    
        type = self.restorationIdentifier!
        
        Alamofire.request("http://cs-server.usc.edu:12318/hw9.php?q=\(keyword)&type=\(type)", method: .get).validate().responseJSON{
            response in
                switch response.result{
                    case .success(let value):
                        self.data = JSON(value)["data"]
                        self.tableView.reloadData()
                
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: resultCell
        if type == "user"{
            cell = tableView.dequeueReusableCell(withIdentifier: "user_resultCell", for: indexPath) as! resultCell
            
            if let name = self.data[indexPath.row]["name"].string{
                cell.name.text! = name
            }
            
            if let img = self.data[indexPath.row]["picture"]["data"]["url"].string{
                if let imgUrl = NSURL(string: img){
                    if let imgData = NSData(contentsOf: imgUrl as URL){
                        cell.picture.image=UIImage(data: imgData as Data)
                    }
                }
            }
            
            return cell
        }else if type == "page"{
            cell = tableView.dequeueReusableCell(withIdentifier: "page_resultCell", for: indexPath) as! resultCell
            
            if let name = self.data[indexPath.row]["name"].string{
                cell.name.text! = name
            }
            
            if let img = self.data[indexPath.row]["picture"]["data"]["url"].string{
                if let imgUrl = NSURL(string: img){
                    if let imgData = NSData(contentsOf: imgUrl as URL){
                        cell.picture.image=UIImage(data: imgData as Data)
                    }
                }
            }
            
            return cell
        }else if type == "event"{
            cell = tableView.dequeueReusableCell(withIdentifier: "event_resultCell", for: indexPath) as! resultCell
            
            if let name = self.data[indexPath.row]["name"].string{
                cell.name.text! = name
            }
            
            if let img = self.data[indexPath.row]["picture"]["data"]["url"].string{
                if let imgUrl = NSURL(string: img){
                    if let imgData = NSData(contentsOf: imgUrl as URL){
                        cell.picture.image=UIImage(data: imgData as Data)
                    }
                }
            }
            
            return cell
        }else if type == "group"{
            cell = tableView.dequeueReusableCell(withIdentifier: "group_resultCell", for: indexPath) as! resultCell
            
            if let name = self.data[indexPath.row]["name"].string{
                cell.name.text! = name
            }
            
            if let img = self.data[indexPath.row]["picture"]["data"]["url"].string{
                if let imgUrl = NSURL(string: img){
                    if let imgData = NSData(contentsOf: imgUrl as URL){
                        cell.picture.image=UIImage(data: imgData as Data)
                    }
                }
            }
            
            return cell
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "group_resultCell", for: indexPath) as! resultCell
            
            if let name = self.data[indexPath.row]["name"].string{
                cell.name.text! = name
            }
            
            if let img = self.data[indexPath.row]["picture"]["data"]["url"].string{
                if let imgUrl = NSURL(string: img){
                    if let imgData = NSData(contentsOf: imgUrl as URL){
                        cell.picture.image=UIImage(data: imgData as Data)
                    }
                }
            }
            
            return cell
        }
        
       
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = self.data[indexPath.row]["id"].string{
            idBuf = id
        }
    }

}
