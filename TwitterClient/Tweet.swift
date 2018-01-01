//
//  Tweet.swift
//  TwitterClient
//
//  Created by 福嶋瞭 on 2018/01/01.
//  Copyright © 2018年 福嶋瞭. All rights reserved.
//

import Foundation

struct Tweet {
    
    // Tweetのid
    let id: String
    
    // Tweetの本文
    let text: String
    
    // このTweetの主
    let user: User

}
