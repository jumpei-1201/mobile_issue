//
//  ViewController.swift
//  jankena_app
//
//  Created by 幸田 純平 on 2020/05/03.
//  Copyright © 2020 幸田 純平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // タイマーの変数を作成
    var timer : Timer?
    var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.animetion_start(_:)), userInfo: nil, repeats: false)
    }


    @IBOutlet weak var enemy: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func gu(_ sender: Any) {
        janken(you: .rock)
    }
    @IBAction func choki(_ sender: Any) {
        janken(you: .scissors)
    }
    @IBAction func pa(_ sender: Any) {
        janken(you: .paper)
    }

    enum Hand{
        case rock, scissors, paper
    }
    enum Result{
        case win, draw, lose
    }

    func janken( you:Hand ) -> Optional<Int>{
        let num_random:Int = Int(arc4random_uniform(UInt32(3)))
        let hand:[String] = ["rock", "scissors", "paper"]
        let pchand:String = hand[num_random]
        var result:String = "no much"
        switch you {
        case .rock :
            if pchand == "rock" {
                result = "you draw"
            }else if pchand == "scissors" {
                result = "you win!"
            }else if pchand == "paper" {
                result = "you lose"
            }
        case .scissors:
            if pchand == "rock" {
                result = "you lose"
            }else if pchand == "scissors" {
                result = "you draw"
            }else if pchand == "paper" {
                result = "you win!"
            }
        case .paper:
            if pchand == "rock" {
                result = "you win!"
            }else if pchand == "scissors" {
                result = "you lose"
            }else if pchand == "paper" {
                result = "you draw"
            }
        }
        
        var pchandLabel = UIImage()
        if pchand == "rock" {
            pchandLabel = UIImage(named: "gu")!
        }else if pchand == "scissors" {
            pchandLabel = UIImage(named: "choki")!
        }else if pchand == "paper" {
            pchandLabel = UIImage(named: "pa")!
        }
        print("cp : \(pchand).", result, separator: " ")
        enemy.image = pchandLabel
        

        // アニメーションを終了
//        imageView.stopAnimating()
        enemy.stopAnimating()
        viewDidLoad().self
        resultLabel.text = result
        return nil
    }
    
    @IBOutlet weak var gou: UIImageView!
    @objc func animetion_start(_ timer:Timer) {
        
        // アニメーション用の画像
        let image1 = UIImage(named:"gu")!
        let image2 = UIImage(named:"choki")!
        let image3 = UIImage(named:"pa")!

        // UIImage の配列を作る
        let imageListArray :Array<UIImage> = [image1, image2, image3]
//
//        // UIImageView のインスタンス生成,ダミーでimage1を指定
//        imageView = UIImageView(image:image1)
//
//        // 画面スクリーンサイズ
//        let screenWidth = self.view.bounds.width
//        let screenHeight = self.view.bounds.height
//
//        // 画像サイズを130-130のImageViewの大きさを設定していく
//        let rect = CGRect(x:0,
//                          y:0,
//                          width:150,
//                          height:150 )
//        imageView.frame = rect
//
//        // 画像が画面中央にくるように位置合わせ
//        imageView.center = CGPoint(x:screenWidth/2-100, y:screenHeight/2-(13+77+169/2))
//
//        // view に追加する
//        self.view.addSubview(imageView)
//
//        // 画像Arrayをアニメーションにセット
//        imageView.animationImages = imageListArray
        enemy.animationImages = imageListArray
        // 間隔（秒単位）
//        imageView.animationDuration = 0.5
        enemy.animationDuration = 0.5

        // アニメーションを開始
//        imageView.startAnimating()
        enemy.startAnimating()

        // アニメーションを終了
        //imageView.stopAnimating()

    }
}

