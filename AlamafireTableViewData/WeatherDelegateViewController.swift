//
//  WeatherDelegateViewController.swift
//  AlamafireTableViewData
//
//  Created by Kirill Drozdov on 21.04.2021.
//

import UIKit

class WeatherDelegateViewController: UIViewController {

    
    @IBOutlet weak var weatherDesccrLAbel: UILabel!
    @IBOutlet weak var pressureArray: UILabel!
    
    var weaterfds = Double()
    var presuereText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherDesccrLAbel.text = String(weaterfds)
        pressureArray.text = presuereText

        // Do any additional setup after loading the view.
    }
  

}
