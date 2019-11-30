//
//  WatsonApi.swift
//  TheRealYou
//
//  Created by brady murphy on 11/29/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation
import PersonalityInsights // this is the IBM Watson



func fetchPersonalityInsightsFromTweets(_ tweets: [Tweet]) {
    let authenticator = WatsonIAMAuthenticator(apiKey: "\(watsonApiKey)")
    let personalityInsights = PersonalityInsights(version: "2017-10-13", authenticator: authenticator)
    personalityInsights.serviceURL = "https://gateway-wdc.watsonplatform.net/personality-insights/api"

    // they were reading from a file
    //let url = Bundle.main.url(forResource: "profile", withExtension: "json")!
    //let content = try JSONDecoder().decode(Content.self, from: Data(contentsOf: url))
    var contentArray = [ContentItem]()
    for tweet in tweets {
        contentArray.append(ContentItem(content: tweet.content, contenttype: tweet.contenttype, language: tweet.language))
    }
    let content = Content(contentItems: contentArray)

    // probably want to add blocking to ensure the linear concurrency
    personalityInsights.profile(profileContent: ProfileContent.content(content)) {
      response, error in

      guard let profile = response?.result else {
        print(error?.localizedDescription ?? "unknown error")
        return
      }

      print(profile)
    }
}
