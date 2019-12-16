//
//  CollectionViewCell.swift
//  WeatherTest
//
//  Created by Abdulazim Muhammadrafiqov on 11/15/19.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var data: List?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        let nib1 = UINib(nibName: "WeaksTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "WeaksTableViewCell")
    }
}


extension CollectionViewCell: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 8
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            guard let temp = data?.main?.temp else {return UITableViewCell()}
            
            cell.headerName.text = data?.name
            cell.headerTemp.text = String(describing: temp) + "°"
            
            return cell
        case 1:
             let cell = tableView.dequeueReusableCell(withIdentifier: "WeaksTableViewCell") as! WeaksTableViewCell
             
             if indexPath.row == 0 {
            
                let date = NSDate(timeIntervalSince1970: Double(data?.sys?.sunrise ?? 0))

                let formatter = DateFormatter()
                formatter.dateStyle = .none
                formatter.timeStyle = .short
                let formattedString = formatter.string(from: date as Date)
                
                cell.params.text = formattedString
                 cell.nameParams.text = "sunrise"
             }else if indexPath.row == 1 {
                let date = NSDate(timeIntervalSince1970: Double(data?.sys?.sunset ?? 0))
                
                let formatter = DateFormatter()
                formatter.dateStyle = .none
                formatter.timeStyle = .short
                let formattedString = formatter.string(from: date as Date)
                
                cell.params.text = formattedString
                cell.nameParams.text = "sunset"
             }else if indexPath.row == 2 {
                guard let humidity = data?.main?.humidity else { return UITableViewCell()}
                
                cell.nameParams.text = "humidity"
                cell.params.text = String(describing: humidity) + " %"
                
             }else if indexPath.row == 3 {
                guard let windSpeed = data?.wind?.speed else {return UITableViewCell()}
                
                cell.nameParams.text = "wind"
                cell.params.text = String(describing: windSpeed) + " m/s"
                
             }else if indexPath.row == 4 {
                guard let temp_min = data?.main?.temp_min else {return UITableViewCell()}
                
                cell.nameParams.text = "temp_min"
                cell.params.text = String(describing: temp_min) + "°"
                
             }else if indexPath.row == 5 {
                guard let temp_max = data?.main?.temp_max else {return UITableViewCell()}
                
                cell.nameParams.text = "temp_max"
                cell.params.text = String(describing: temp_max) + "°"
             }else if indexPath.row == 6 {
                
                cell.nameParams.text = "pressure"
                cell.params.text = "\(data?.main?.pressure ?? 0) p"
                
             }else if indexPath.row == 7 {
                
                cell.nameParams.text = "visibility"
                cell.params.text = "\((data?.visibility ?? 0)/1000) km"
             }
             
        
             
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 166
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
        let view = UIView()
            view.backgroundColor = .white
            return view
        }else if section == 1 {
            
            let view = UIView()
            view.backgroundColor = .white
            return view
        }else{
            return UIView()
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 1.0
        default:
            return 0
        }
    }
    
    
}
