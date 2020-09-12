//
//  ViewController.swift
//  StopWatch
//
//  Created by Haruko Okada on 9/3/20.
//  Copyright © 2020 Haruko Okada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    @IBAction func startBtn(_ sender: Any) { //スタートボタンとストップボタンを一緒にした
       
        if !timer.isValid {
        timer = Timer.scheduledTimer(timeInterval: 0.01 , target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            (sender as AnyObject).setTitle("STOP", for: .normal)
        } else if timer.isValid {
            timer.invalidate()
            (sender as AnyObject).setTitle("START", for: .normal)
            hantei()
        }
    
    }
    
  /* 教科書のストップボタン
    @IBAction func stopBtn(_ sender: Any) {
        
        if timer.isValid {
            timer.invalidate()
        }
        
    } */
    
    @IBAction func resetBtn(_ sender: Any) {
        
        if timer.isValid {
                   timer.invalidate()
        }
        count = 0.0
        timeLabel.text = String(count)
        
    }
    
    @objc func up(){
        count = count + 0.01
        timeLabel.text = String(format: "%0.2f", count)
    }
    
    @objc func hantei(){
        if (count >= 9.8 && count <= 10.2){
            resultLabel.text = "PERFECT"
        } else if (count >= 9.70 && count < 9.8 || count <= 10.3 && count > 10.2) {
            resultLabel.text = "GREAT"
        }  else if (count >= 9.5 && count < 9.7 || count <= 10.5 && count > 10.3) {
                   resultLabel.text = "GOOD"
        } else {
            resultLabel.text = "BAD"
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

