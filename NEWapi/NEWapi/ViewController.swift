//
//  ViewController.swift
//  NEWapi
//
//  Created by 幸田 純平 on 2020/08/11.
//  Copyright © 2020 幸田 純平. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://qiita.com/api/v2/items?page=1&per_page=20").responseJSON {
            res in
            switch res.result {
                case .success(let element): do {
                    /// 成功処理
                    print(JSON(res.data))
                   } catch {
                    /// 失敗処理
                }
                case .failure(let error): do {
                    /// 失敗処理
                    print(error)
                }
            }
        }
    }
}


