//
//  HomeWorkTableViewCell.swift
//  NIBMConnect
//
//  Created by Malindu Dilshan on 5/26/19.
//  Copyright © 2019 Malindu Dilshan. All rights reserved.
//

import UIKit

class HomeWorkTableViewCell: UITableViewCell {

    @IBOutlet weak var homeWorkTitle: UILabel!
    @IBOutlet weak var homeaWorkDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
