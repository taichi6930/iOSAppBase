//
//  TouchIDViewController.swift
//  iosAppBase
//
//  Created by taichi6930 on 2020/03/28.
//  Copyright © 2020 taichi6930. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDViewController: UIViewController {
    
    @IBOutlet weak var touchIDLabel: UILabel!
    @IBOutlet weak var touchIDButton: UIButton!
    
    let context = LAContext()
    var error: NSError?
    var descript: String = ""
    
    // 初回にしか呼ばれないメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            var title: String = "生体認証不可"
            switch self.context.biometryType {
            case .faceID:
                title = "faceID認証"
                break
            case .touchID:
                title = "touchID認証"
                break
            case .none:
                title = "生体認証不可"
                break
            @unknown default:
                break
            }
            touchIDButton.setTitle(title, for: .normal)
            touchIDButton.addTarget(self, action: #selector(tapTouchIDButton(_:)), for: .touchUpInside)
        } else {
            touchIDButton.setTitle("生体認証不可", for: .normal)
        }
    }
    
    // 画面が表示された際に呼ばれるメソッド
    override func viewWillAppear(_ animated: Bool) {
        touchIDLabel.text = "未認証"
    }
    
    //ボタンをタップされた際に呼ばれるメソッド
    @objc func tapTouchIDButton(_ sender: UIButton) {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: descript, reply: {success, evaluateError in
                if (success) {
                    DispatchQueue.main.async {
                        self.touchIDLabel.text = "認証成功"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.touchIDLabel.text = "認証失敗"
                    }
                }
            })
        }
    }
}
