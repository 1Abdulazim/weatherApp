//
//  CollectionViewController.swift
//  WeatherTest
//
//  Created by Abdulazim Muhammadrafiqov on 11/15/19.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit
import Alamofire

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: MainWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = true
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        Networking()
    }
    
    func Networking(){
        let urlString = "https://samples.openweathermap.org/data/2.5/group?"
        
        let params: [String:Any] = ["id":"524901","units":"metric","appid":"b6907d289e10d714a6e88b30761fae22"]
        Alamofire.request(urlString, method: .get, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
            let decoder = JSONDecoder()
            guard let json = response.data else {return}
            
            do{
                
                let model = try decoder.decode(MainWeather.self, from: json)
                
                self.data = model
                
                
                self.collectionView.reloadData()
            }catch let error{
                
                print(error.localizedDescription)
            }
        }.resume()
    }
}


extension CollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.data?.cnt {
            return count
        } else {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.data = data?.list?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
