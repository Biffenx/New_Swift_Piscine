//
//  ViewController.swift
//  D00
//
//  Created by Jochum Wilen on 6/12/21.
//  Copyright © 2021 Jochum Wilen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let message = "You have clicked Me!"
    
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func Btn1(_ sender: UIButton) {
        label1.font = UIFont(name:"Didot", size: 30.0)
    }
    @IBAction func Btn2(_ sender: UIButton) {
        label1.font = UIFont(name:"Times new Roman", size: 30.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    label1.text = message

        // Do any additional setup after loading the view.
    }


}

