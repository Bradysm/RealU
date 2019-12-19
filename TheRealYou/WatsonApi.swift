//
//  WatsonApi.swift
//  TheRealYou
//
//  Created by brady murphy on 11/29/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation
import PersonalityInsights // this is the IBM Watson


/**
 Fetches personality insights using tweets gained from a users timeline
 The function utilizes IBM Watson's AI to generate a Profile containing derived information
 from the tweets. If there is an error in getting the profile from Watson, then nil will be returned
 from the function. Otherwise, the generated profile will be returned.
 
 @Param: tweets - array of tweets
 @Return - profile generated from users tweets
 */
func fetchPersonalityInsightsFromTweets(_ tweets: [Tweet]) -> Profile? {
    var resultProfile: Profile?
    
    let authenticator = WatsonIAMAuthenticator(apiKey: "\(watsonApiKey)")
    let personalityInsights = PersonalityInsights(version: "2017-10-13", authenticator: authenticator)
    personalityInsights.serviceURL = "https://gateway-wdc.watsonplatform.net/personality-insights/api"
    
    // map tweets into a content array and create Content from it
    let content = Content(contentItems:  tweets.map { ContentItem(content: $0.content, contenttype: $0.contenttype, language: $0.language) })
    let semaphore = DispatchSemaphore(value: 0)
    
    /**
     Creates the personality profile using IBM Waatson's profile insights
     Requests to also gain insights on the users consumption preferences
     */
    personalityInsights.profile(profileContent: ProfileContent.content(content), consumptionPreferences: true) {
        response, error in
        
        guard let profile = response?.result else {
            print(error?.localizedDescription ?? "unknown error")
            semaphore.signal()
            return
        }
        
        // update the result, and signla completion
        resultProfile = profile
        print(profile)
        semaphore.signal()
    }
    
    // wait for insights and return profile
    semaphore.wait()
    return resultProfile
}
