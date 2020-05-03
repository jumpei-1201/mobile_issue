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
        self.yearlabel.keyboardType = UIKeyboardType.numberPad
    }

    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var yearlabel: UITextField!
    
    @IBAction func Run(_ sender: Any) {
        yearlabel.endEditing(true)
        let year = Int(yearlabel.text!)
        let ans : String
        if year! % 4 == 0 {
            ans = "is"
        }else {
            ans = "is not"
        }
        result.text = (yearlabel.text! + " " + ans + " leap year.")
    }
}

