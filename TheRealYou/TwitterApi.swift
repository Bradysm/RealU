//
//  TwitterApi.swift
//  TheRealYou
//
//  Created by brady murphy on 11/29/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation

/**
 User timeline path api
 */
fileprivate let timelineApiUrl = "https://api.twitter.com/1.1/statuses/user_timeline.json?"



/**
 This function takes the handle of a twitter user and returns an array of tweets containing up to  3000 of their
 most recent tweets. If the twitter handle is not valid, then an empty array of tweets will be returned.
 
 @Param - name of the twitter handle
 @Param - numberOfTweets is an optional parameter that lets you specifity the number of most recent tweets to retrieve
 @Return - array of Tweet structs
 */
func fetchRecentTweets(fromHandle handle: String, numberOfTweets count: Int = 3000) -> [Tweet] {
    var tweets = [Tweet]()
    
    // create URL and the HTTP request
    let apiUrl = "\(timelineApiUrl)screen_name=\(handle)&count=\(count)"
    guard let requestUrl = URL(string: apiUrl) else { return tweets }
    var request = URLRequest(url: requestUrl)
    request.addValue(twitterBearerToken, forHTTPHeaderField: "Authorization")
    
    // make request and force thread blocking using a semaphore
    let semaphore = DispatchSemaphore(value: 0)
    URLSession.shared.dataTask(with: request) { (data, res, err) in
        guard let data = data else { semaphore.signal(); return } // unwrap the data
        
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            guard let tweetArray = jsonResponse as? [Any] else { semaphore.signal(); return }
            print(tweetArray.count)
            
            //TODO: Parse data
            
            semaphore.signal() // signal completion
            
        } catch {
            semaphore.signal()
            return
        }
        
    }.resume()
    
    //wait for data then return the tweets
    semaphore.wait()
    return tweets
}
