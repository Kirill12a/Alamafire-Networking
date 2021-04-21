//
//  UsersMainCollectionViewController.swift
//  AlamafireTableViewData
//
//  Created by Kirill Drozdov on 19.04.2021.
//

import UIKit
import Alamofire
import SwiftyJSON


class UsersMainCollectionViewController: UICollectionViewController {
    
    var weathersDEW = [DEW]()
    var weathersName = [WETH]()
    private let KeyWeatherData = "04058a1cfb3995f113f971c8390a19ae"
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableView()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cef3")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weathersDEW.count
    }

    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserDataPostCollectionViewCell
        
        cell.nameUser.text = String(weathersDEW[indexPath.row].dew_point!)
        cell.emailUser.text = String(weathersDEW[indexPath.row].pressure!)
        
//        cell.descriptionUser.text = String(weatherName[indexPath.row].description!)
    
     //MARK: fdfasfasfwe//efwq/feqw/fw/qf/wqf/wqf/wqf
        return cell
    }
    
    func updateTableView(){
        AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=55.75&lon=37.61&exclude=minutely,hourly,alerts,current&appid=\(KeyWeatherData.self)&lang=ru&units=metric")
            .validate()
            .responseDecodable(of: WeathersApi.self) { (response) in
                guard let weth = response.value else {print("что то не так")
                    return
                }
                self.weathersDEW =  weth.daily
                
                self.collectionView.reloadData()
                print("скачано успешно")
                
                
            }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("GGG")
    }
  

}
