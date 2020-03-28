//
//  AlertViewController.swift
//  iosAppBase
//
//  Created by taichi6930 on 2020/03/28.
//  Copyright © 2020 taichi6930. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var alertButton: UIButton!
    
    // 初回にしか呼ばれないメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertButton.addTarget(self, action: #selector(tapAlertButton(_:)), for: .touchUpInside)
    }
    
    //アラートが表示される処理を行う
    @objc func tapAlertButton(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction( title: "OK",
                                                          style: .default,
                                                          handler: {
                                                            (action: UIAlertAction!) in
                                                            print("OK")
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",
                                                        style: .cancel,
                                                        handler:  {
                                                            (action: UIAlertAction!) in
                                                            print("キャンセル")
        })
        alertVC.addAction(defaultAction)
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true, completion: nil)
    }
}
