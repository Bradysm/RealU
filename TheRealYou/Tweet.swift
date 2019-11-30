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
 
 Names correspond to the JSON that is expected for IBM Watson
 */
struct Tweet: Codable, Hashable {
    var content: String  // the body of the tweet
    var contenttype: String // could be an image usually will be text/plain
    var created: Int // we might have to change this if it can't hold it
    var id: Int // the id of the tweet
    var language: String
}



/**
 This function takes a JSON object (dictionary) corresponding to twitters JSON protocol defined in their API
 and parses the data into a Tweet struct. The struct is optional incase there is missing values that are needed for
 the Tweet object. The function will return nil if there is missing data.
 
 @Param - tweetObject is a string to Any dictionary
 @return - Tweet struct initialized with the parsed data
 */
func parseTweet(_ tweetObject: [String: Any]) -> Tweet? {
    var tweet: Tweet? = nil
    
    guard let text = tweetObject["text"] as? String else { return tweet }
    guard let id = tweetObject["id"] as? Int else { return tweet }
    
    tweet = Tweet(content: text, contenttype: "text/plain", created: 0, id: id, language: "en")
    return tweet
}


