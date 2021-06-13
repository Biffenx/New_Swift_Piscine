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

    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var time_picker: UIDatePicker!
    
    @IBAction func Btn1(_ sender: UIButton) {
        label1.font = UIFont(name:"Didot", size: 30.0)
        
        self.emitterLayer.birthRate = 0;
    }
    
    @IBAction func Btn2(_ sender: UIButton) {
        label1.font = UIFont(name:"Times new Roman", size: 30.0)
        emitterLayer.emitterCells = confetti()
        self.emitterLayer.birthRate = 1;
        view.layer.addSublayer(emitterLayer)
    }
    
    @IBAction func Btn3(_ sender: UIButton) {
        let date1 = Date()
        let date = time_picker.date
        let timeInterval = date.timeIntervalSince(date1)
        let y = Int(round(timeInterval))
        alarmLabel.text = ("Your alarm will go off in: \(y) sec.")
        let date2 = Date().addingTimeInterval(timeInterval)
        let timer = Timer(fireAt: date2, interval: 0, target: self, selector: #selector(runCode), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: RunLoop.Mode.common)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        label1.text = message
        alarmLabel.text = ""
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
        
    @objc func runCode()
           {
               let alert = UIAlertController(title: "Wake Up!", message: "Alarm on", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
               self.present(alert, animated: true)
           }
}

