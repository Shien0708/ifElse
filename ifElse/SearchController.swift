//
//  SearchController.swift
//  ifElse
//
//  Created by 方仕賢 on 2022/1/7.
//

import Foundation
import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var idealPersonLabel: UILabel!
    @IBOutlet weak var idealAgeSlider: UISlider!
    var person = ViewController()
    @IBOutlet weak var idealAgeLabel: UILabel!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
    }
    
    @IBAction func idealAgeSlider(_ sender: UISlider) {
        
        idealAgeLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        print("\(person.age)")
        print("\(person.names)")
        
    }
    
}
