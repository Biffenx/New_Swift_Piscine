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
        print(message)
        label1.text = message
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

