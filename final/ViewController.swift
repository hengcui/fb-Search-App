//
//  ViewController.swift
//  final
//
//  Created by heng cui on 2017/4/26.
//  Copyright © 2017年 heng cui. All rights reserved.
//

import UIKit

var keyword:String = ""
var type: String = "user"
var idBuf: String! = ""

class ViewController: UIViewController {

    @IBOutlet weak var searchText: UITextField!
   
    @IBAction func submit(_ sender: UIButton) {
        keyword = searchText.text!
    }
    @IBOutlet weak var back: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        back.target = self.revealViewController()
        back.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

