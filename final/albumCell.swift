//
//  albumCell.swift
//  final
//
//  Created by heng cui on 2017/4/27.
//  Copyright © 2017年 heng cui. All rights reserved.
//

import UIKit

class albumCell: UITableViewCell {

    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var picture2: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
