//
//  WebViewController.swift
//  iosAppBase
//
//  Created by taichi6930 on 2020/03/28.
//  Copyright © 2020 taichi6930. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    // 初回にしか呼ばれないメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    // WebViewの設定をここで行う
    func setWebView() {
        if let url = NSURL(string: "https://www.google.com") {
            let request = NSURLRequest(url: url as URL)
            webView.load(request as URLRequest)
        }
    }
}
