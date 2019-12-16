//
//  TableViewCell.swift
//  WeatherTest
//
//  Created by Abdulazim Muhammadrafiqov on 11/15/19.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var headerTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
