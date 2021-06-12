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
        Alert()
    }
    @IBAction func Btn2(_ sender: UIButton) {
        label1.font = UIFont(name:"Times new Roman", size: 30.0)
        Alert()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    label1.text = message

        // Do any additional setup after loading the view.
    }

  func Alert() {
    let alert = UIAlertController(title: "Notice", message: "The font was changed.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
    self.present(alert, animated: true)
    }
}

