//
//  ViewController.swift
//  iosAppBase
//
//  Created by taichi6930 on 2020/03/28.
//  Copyright © 2020 taichi6930. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // TableViewCell内の文字列とViewController名をここで定義する
    let tableViewCellDataList = [
        ["title":"TableView","viewController":"TableViewController"],
        ["title":"CollectionView","viewController":"CollectionViewController"],
        ["title":"WebView","viewController":"WebViewController"],
        ["title":"TouchID","viewController":"TouchIDViewController"],
        ["title":"Alert","viewController":"AlertViewController"]
    ]
    
    // 初回にしか呼ばれないメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //セクションのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "タイトル"
    }
    // cellを生成する数をここで設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellDataList.count
    }
    
    // cell内の情報をここで設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableViewCellDataList[indexPath.row]["title"]
        return cell
    }
    // cellタップ後の処理をここで設定する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // タップ時の選択状態を解除する
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 新しいページに遷移する
        let storyboardName = tableViewCellDataList[indexPath.row]["viewController"]!
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }
}
