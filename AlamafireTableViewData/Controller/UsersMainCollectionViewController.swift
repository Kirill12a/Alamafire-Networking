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
    
    var presureTE = ["Нормуль","Отлично","Так себе","Плохое","Отлично","Очень хорошо","Ну так себе","Очень плохо"]
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
        cell.descriptionUser.text =  String(weathersDEW[indexPath.row].wind_speed!)
//        cell.descriptionUser.text = presureTE[indexPath.row]
        
//        cell.descriptionUser.text = String(weatherName[indexPath.row].description!)
    
     //MARK: fdfasfasfwe//efwq/feqw/fw/qf/wqf/wqf/wqf
        return cell
    }
    
    /// Add request data base
    func updateTableView(){
        AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=56.75&lon=38.61&exclude=minutely,hourly,alerts,current&appid=\(KeyWeatherData.self)&lang=ru&units=metric")
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
        
        print("ВЫ нажали на \(weathersDEW[indexPath.row].dew_point!) и давление тут равно \(presureTE[indexPath.row]), и ветер \(weathersDEW[indexPath.row].wind_speed!)")
        let vcDES = storyboard?.instantiateViewController(identifier: "WeatherDelegateViewController") as? WeatherDelegateViewController
        DispatchQueue.main.async {
            vcDES?.weaterfds = Double(self.weathersDEW[indexPath.row].dew_point!)
        
            vcDES?.presuereText = String(self.presureTE[indexPath.row])
        
        self.navigationController?.pushViewController(vcDES!, animated: true)
        }
    }
  

}
