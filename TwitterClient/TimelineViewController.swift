//
//  TimelineViewController.swift
//  TwitterClient
//
//  Created by 福嶋瞭 on 2018/01/01.
//  Copyright © 2018年 福嶋瞭. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // テーブル表示用のデータソース
    var tweets: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // delegateの指定を自分自身(self = TimeLineViewController)に設定
        tableView.delegate = self
        
        // dataSourceの指定を自分自身(self = TimeLineViewController)に設定
        tableView.dataSource = self
        
        let user = User(id: "1", screenName: "putchom", name: "テストアカウント", profileImageURL: "https://pbs.twimg.com/profile_images/792038259543060481/nEnrBNv5.jpg")
        let tweet = Tweet(id: "01", text: "テストツイートです。はじめましてこんにちは。", user: user)
        
        let tweets = [tweet]
        self.tweets = tweets
        
        // tableViewのリロード
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TimelineViewController: UITableViewDelegate {
    
    // cellがタップされたのを検知したときに実行する処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セルがタップされたよ！")
    }
    
    // セルの見積もりの高さを指定する処理
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // セルの高さを指定する処理
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // UITableViewCellの高さを自動で取得する値
        return UITableViewAutomaticDimension
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    // 何個のセルを生成するかを設定する関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // tweetsの配列内の要素数分を指定
        return tweets.count
    }
    
    // 描画するcellを設定する関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TweetTableViewCellを表示したいので、TweetTableViewCellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as! TweetTableViewCell
        
        // TweetTableViewCellの描画内容となるtweetを渡す
        cell.fill(tweet: tweets[indexPath.row])
        
        return cell
    }
    
}
