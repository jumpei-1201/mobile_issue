//
//  ViewController.swift
//  isLeap
//
//  Created by 幸田 純平 on 2020/05/03.
//  Copyright © 2020 幸田 純平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.yearLabel.keyboardType = UIKeyboardType.numberPad
    }

    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var yearLabel: UITextField!
    
    @IBAction func Run(_ sender: Any) {
        yearLabel.endEditing(true)
//        let year = Int(yearLabel.text!)
        guard
            let unwrappedYearLabel = yearLabel.text,
            let year = Int(unwrappedYearLabel) else {
                return
        }
        let ans : String
        if year % 4 == 0 {
            if year % 100 == 0 {
                if year % 400 == 0 {
                    ans = "is"
                } else {
                    ans = "is not"
                }
            } else {
                ans = "is"
            }
        }else {
            ans = "is not"
        }
        
        result.text = (yearLabel.text! + " " + ans + " leap year.")
    }
}

