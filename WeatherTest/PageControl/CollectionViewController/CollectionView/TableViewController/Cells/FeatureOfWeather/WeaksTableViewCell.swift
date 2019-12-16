//
//  WeaksTableViewCell.swift
//  WeatherTest
//
//  Created by Abdulazim Muhammadrafiqov on 11/16/19.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit

class WeaksTableViewCell: UITableViewCell {
    @IBOutlet weak var nameParams: UILabel!
    @IBOutlet weak var params: UILabel!
    
    
    
    var data: List?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
