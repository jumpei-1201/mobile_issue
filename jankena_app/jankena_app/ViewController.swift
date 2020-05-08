//
//  ViewController.swift
//  jankena_app
//
//  Created by 幸田 純平 on 2020/05/03.
//  Copyright © 2020 幸田 純平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlet系のクラス変数 //
    @IBOutlet weak var enemy: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // クラス変数 //
    var imageView:UIImageView!
    // アニメーション用の画像のリスト
    let imageListArray :[UIImage] = [Hand.rock.image(), Hand.scissors.image(), Hand.paper.image()]
    
    enum Hand: Int{
        case rock = 0
        case scissors = 1
        case paper = 2
        
        func image() -> UIImage {
            switch self {
            case .rock: return #imageLiteral(resourceName: "gu")
            case .scissors: return #imageLiteral(resourceName: "choki")
            case .paper: return #imageLiteral(resourceName: "pa")
            }
        }
    }
    enum Result: String{
        case win = "Win!"
        case draw = "Draw"
        case lose = "Lose"
        case no = "no much"
    }

    // ViewControllerのライフサイクル系 //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animation_start()
    }
    
    // IBAction系 //
    @IBAction func gu(_ sender: Any) {
        janken(you: .rock)
    }
    @IBAction func choki(_ sender: Any) {
        janken(you: .scissors)
    }
    @IBAction func pa(_ sender: Any) {
        janken(you: .paper)
    }


    // 内部メソッド系 //
    func janken( you:Hand ) {
        
        guard let pchand = Hand(rawValue: Int(arc4random_uniform(UInt32(3)))) else {
            return
        }
        var result:Result = .no
        
        let numResult = (you.rawValue - pchand.rawValue + 3) % 3
        
        if numResult == 0 {
            result = .draw
        } else if numResult == 1 {
            result = .lose
        } else if numResult == 2 {
            result = .win
        }
        
        
        print("cp: \(pchand). you \(result.rawValue)")
        enemy.image = pchand.image()

        enemy.stopAnimating()
        resultLabel.text = "you \(result.rawValue)"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.reset()
        }
    }
    
    func animation_start() {
        enemy.animationImages = imageListArray
        enemy.animationDuration = 0.5
        // アニメーションを開始
        enemy.startAnimating()

    }
    func reset() {
        animation_start()
        resultLabel.text = "JANKEN..."
    }
}

