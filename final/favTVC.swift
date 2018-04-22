//
//  favTVC.swift
//  final
//
//  Created by heng cui on 2017/4/26.
//  Copyright © 2017年 heng cui. All rights reserved.
//

import UIKit

class favTVC: UITableViewController {

    @IBOutlet weak var back: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        back.target = revealViewController()
        back.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

}
