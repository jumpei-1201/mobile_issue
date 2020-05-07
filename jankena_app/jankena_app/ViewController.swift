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
    // アニメーション用の画像
    let rockImage = #imageLiteral(resourceName: "gu")
    let sissorsImage = #imageLiteral(resourceName: "choki")
    let paperImage = #imageLiteral(resourceName: "pa")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel.text = "JANKEN..."
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

    enum Hand: Int{
        case rock = 0
        case scissors = 1
        case paper = 2
    }
    enum Result: String{
        case win = "Win!"
        case draw = "Draw"
        case lose = "Lose"
        case no = "no much"
    }

    func janken( you:Hand ) {
        let num_random:Int = Int(arc4random_uniform(UInt32(3)))
        let hand:[Hand] = [.rock, .scissors, .paper]
        let pchand = hand[num_random]
        var result:Result = .no
        
        let num_result = (you.rawValue - pchand.rawValue + 3) % 3
        
        if num_result == 0 {
            result = .draw
        } else if num_result == 1 {
            result = .lose
        } else if num_result == 2 {
            result = .win
        }
        
        var pchandLabel = UIImage()
        if pchand == .rock {
            pchandLabel = UIImage(named: "gu")!
        }else if pchand == .scissors {
            pchandLabel = UIImage(named: "choki")!
        }else if pchand == .paper {
            pchandLabel = UIImage(named: "pa")!
        }
        print("cp: \(pchand). you \(result.rawValue)")
        enemy.image = pchandLabel
        

        // アニメーションを終了
//        imageView.stopAnimating()
        enemy.stopAnimating()
        resultLabel.text = "you \(result.rawValue)"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.resultLabel.text = "JANKEN..."
            self.timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.animetion_start(_:)), userInfo: nil, repeats: false)
        self.resultLabel.text = "JANKEN..."
        }
    }
    
    @objc func animetion_start(_ timer:Timer) {
        
        // UIImage の配列を作る
        let imageListArray :[UIImage] = [rockImage, sissorsImage, paperImage]
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

