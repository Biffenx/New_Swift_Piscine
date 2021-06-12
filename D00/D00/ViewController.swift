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
    let emitterLayer = CAEmitterLayer()
    let dimension = 4
    var colors: [UIColor] = [.red, .green, .blue, .magenta]
    var imageNames = ["snowflake-1", "diamond", "heart", "star"]
    var velocities = [50, 100, 150, 200]

    @IBOutlet weak var label1: UILabel!
        
    @IBAction func Btn1(_ sender: UIButton) {
        label1.font = UIFont(name:"Didot", size: 30.0)
        self.emitterLayer.birthRate = 0;
    }
    @IBAction func Btn2(_ sender: UIButton) {
        label1.font = UIFont(name:"Times new Roman", size: 30.0)
        self.emitterLayer.birthRate = 1;
        emitterLayer.emitterCells = confetti()
        view.layer.addSublayer(emitterLayer)   }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    label1.text = message
        


                     
                 view.layer.addSublayer(emitterLayer)
        // Do any additional setup after loading the view.
    }
    var randomNumber: Int {
        return Int(arc4random_uniform(UInt32(dimension)))
    }
    var randomStart: Int {
          return Int(arc4random_uniform(UInt32(400)))
      }
  
    
    
    func confetti() -> [CAEmitterCell]
    {
        var cells = [CAEmitterCell]()
        emitterLayer.emitterPosition = CGPoint(x: randomStart, y: randomStart)
              
        for _ in 0..<10 {
            let cell = CAEmitterCell()
            cell.birthRate = 5
            cell.lifetime = 10
            cell.velocity = CGFloat(velocities[randomNumber])
            cell.scale = CGFloat(drand48() / 10)
            cell.spin = 3.5
            cell.color = colors[randomNumber].cgColor
            cell.emissionRange = CGFloat.pi * 2.0
            cell.contents = UIImage(named: imageNames[randomNumber])!.cgImage
            cells.append(cell)
        }
              
          return cells
    }
        
    
    
  func Alert() {
    let alert = UIAlertController(title: "Notice", message: "The font was changed.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
    self.present(alert, animated: true)
    }
}

