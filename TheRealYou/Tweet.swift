//
//  Tweet.swift
//  TheRealYou
//
//  Created by brady murphy on 11/29/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation


/**
 This struct represents a tweet from a user on twitter
 */
struct Tweet: Codable, Hashable {
    var content: String  // the body of the tweet
    
    var id: String // the id of the tweet
    var contentType: String // could be an image usually will be text/plain
    var language: String
    var created: Int // we might have to change this if it can't hold it
}



