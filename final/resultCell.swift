//
//  resultCell.swift
//  final
//
//  Created by heng cui on 2017/4/26.
//  Copyright © 2017年 heng cui. All rights reserved.
//

import UIKit

class resultCell: UITableViewCell {

    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func toggleStar(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "empty"){
            sender.setImage(#imageLiteral(resourceName: "filled"), for: .normal)
            UserDefaults.standard.set(picture.image, forKey: name.text!)
        }else
        {
            sender.setImage(#imageLiteral(resourceName: "empty"), for: .normal)
            UserDefaults.standard.removeObject(forKey: name.text!)
        }
    }
  
}
