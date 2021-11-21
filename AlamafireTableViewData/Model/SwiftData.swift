//
//  File.swift
//  AlamafireTableViewData
//
//  Created by Kirill Drozdov on 19.04.2021.
//

import Foundation

struct WeathersApi: Decodable {
    let daily: [DEW]
    
}

struct DEW: Decodable {
    let dew_point: Double?
    let pressure: Int?
    let wind_speed: Double?
    
  
     //MARK: Тоже самое что и ниже
    let weather: [WETH]
    
}


 //MARK: Нужно переработать

struct WETH: Decodable {
    let main: String?
}
