//
//  PostTVC.swift
//  final
//
//  Created by heng cui on 2017/4/26.
//  Copyright © 2017年 heng cui. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SwiftSpinner

import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

class PostTVC: UITableViewController {
    var data:JSON = []
    var imgUrl:String = ""
    var detailName:String = ""
    
    @IBAction func option(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        var favAction = UIAlertAction()
        if(UserDefaults.standard.object(forKey: self.detailName) != nil){
            favAction = UIAlertAction(title: "Remove from favorites", style: .default) { action in
                UserDefaults.standard.removeObject(forKey: self.detailName)
            }
        }else{
            favAction = UIAlertAction(title: "Add favorites", style: .default){ action in
                UserDefaults.standard.set(type, forKey: self.detailName)
            }
        }
        
        alertController.addAction(favAction)
        
        let shareAction = UIAlertAction(title: "Share", style: .default){ action in
            let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
            content.contentURL = NSURL(string: self.imgUrl)! as URL
            FBSDKShareDialog.show(from: self, with: content, delegate: nil)
            }
            
        alertController.addAction(shareAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("hello")
        }
        
        alertController.addAction(cancelAction)
        
    }
        
    override func viewDidLoad() {
        SwiftSpinner.show(duration: 4.0, title: "loading data...")
        super.viewDidLoad()
   
        Alamofire.request("http://cs-server.usc.edu:12318/hw9.php?id=\(idBuf!)", method: .get).validate().responseJSON{
            response in
            switch response.result{
            case .success(let value):
                self.data = JSON(value)["post"]["data"]
                self.imgUrl = JSON(value)["picture"]["data"]["url"].string!
                self.detailName = JSON(value)["name"].string!
                
                self.tableView.reloadData()
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
        
    }
 
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.data.count != 0){
            return self.data.count
        }else{
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if type == "user"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "user_postCell", for: indexPath) as! postCell
            
            if self.data.count == 0{
                cell.message.text! = "nil"
                 SwiftSpinner.hide()
                return cell
            }else{
                if let postmsg = data[indexPath.row]["message"].string{
                    cell.message.text! = postmsg
                }
                if let postimg = data[indexPath.row]["picture"]["data"]["url"].string{
                    if let url = NSURL(string: postimg){
                        if let imgData = NSData(contentsOf: url as URL){
                            cell.picture.image=UIImage(data: imgData as Data)
                        }
                    }
                }
                 SwiftSpinner.hide()
                return cell
            }
        }
        
        else if type == "page" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "page_postCell", for: indexPath) as! postCell
            
            if self.data.count == 0{
                cell.message.text! = "nil"
                 SwiftSpinner.hide()
                return cell
            }else{
                if let postmsg = data[indexPath.row]["message"].string{
                    cell.message.text! = postmsg
                }
                if let postimg = data[indexPath.row]["picture"]["data"]["url"].string{
                    if let url = NSURL(string: postimg){
                        if let imgData = NSData(contentsOf: url as URL){
                            cell.picture.image=UIImage(data: imgData as Data)
                        }
                    }
                }
                return cell
            }
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "event_postCell", for: indexPath) as! postCell
            
            if self.data.count == 0{
                cell.message.text! = "nil"
                return cell
            }else{
                if let postmsg = data[indexPath.row]["message"].string{
                    cell.message.text! = postmsg
                }
                if let postimg = data[indexPath.row]["picture"]["data"]["url"].string{
                    if let url = NSURL(string: postimg){
                        if let imgData = NSData(contentsOf: url as URL){
                            cell.picture.image=UIImage(data: imgData as Data)
                        }
                    }
                }
                 SwiftSpinner.hide()
                return cell
            }
        }

        

    }
}
