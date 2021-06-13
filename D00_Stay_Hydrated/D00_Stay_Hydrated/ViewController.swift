//
//  ViewController.swift
//  D00_Stay_Hydrated
//
//  Created by Jochum Wilen on 6/13/21.
//  Copyright © 2021 Jochum Wilen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var progessBar: UIProgressView!
    
    let progress = Progress(totalUnitCount: 6)
    
  
    var waterConsumed = 0
    var timer: Timer?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("1:\(waterConsumed)")
        progessBar.transform = progessBar.transform.scaledBy(x: 1, y: 30)

        
    }

  @IBAction func startTap(_ sender: UIButton) {
    progessBar.progress = 0
    timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(drinkWaterWarning), userInfo: nil, repeats: true)
    print("3:\(waterConsumed)")
//    if waterConsumed > 20 {
//            timer?.invalidate()
//                 }
    //    guard self.progress.isFinished == false else {
//        timer?.invalidate()
//        print("Finnish")
//        return
//    }
//    self.progress.completedUnitCount += 1
    
//    let progressFloat = Float(self.progress.fractionCompleted)
//    self.progessBar.setProgress(progressFloat, animated: true)
    
    }
    
    
    @objc func drinkWaterWarning()
    {
        let alert = UIAlertController(title: "Alert", message: "Drink water", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.waterConsumed += 5
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progessBar.setProgress(progressFloat, animated: true)
            print("2:\(self.waterConsumed)")
            guard self.progress.isFinished == false else {
                self.timer?.invalidate()
                 print("Finnish")
                 return
             }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//        if waterConsumed > 20 {
//                  timer?.invalidate()
//              }
        self.present(alert, animated: true)
    }
    
}

   

