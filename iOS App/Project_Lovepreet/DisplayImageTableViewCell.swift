//
//  DisplayImageTableViewCell.swift
//  Project_Lovepreet
//
//  Created by LOVEPREET VERMA on 27/11/18.
//  Copyright © 2018 LOVEPREET VERMA. All rights reserved.
//

import UIKit
import CoreData

class DisplayImageTableViewCell: UITableViewCell {

    @IBOutlet weak var displayCaption: UILabel!
    @IBOutlet weak var displayImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
