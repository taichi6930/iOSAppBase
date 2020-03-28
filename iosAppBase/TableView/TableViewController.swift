//
//  TableViewController.swift
//  iosAppBase
//
//  Created by taichi6930 on 2020/03/28.
//  Copyright © 2020 taichi6930. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // TableViewCell内の文字列をここで定義する
    let cellDataList = [["title":"change Cell background color"],
                        ["title":"change Cell Label"]
    ]
    
    // 初回にしか呼ばれないメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    // cellを生成する数をここで設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDataList.count
    }
    
    // cell内の情報をここで設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cellDataList[indexPath.row]["title"]
        
        // UITableViewのセルをハイライトさせない
        cell.selectionStyle = .none
        return cell
    }
    
    // cellタップ後の処理をここで設定する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath),
            let text = cell.textLabel?.text {
            
            switch text {
            case "change Cell background color":
                cell.backgroundColor = .systemRed
                break
            case "change Cell Label":
                cell.textLabel?.text = "Change Label text!!!!"
            default:
                break
            }
        }
        
        // タップ時の選択状態を解除する
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
