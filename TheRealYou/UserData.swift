//
//  UserData.swift
//  TheRealYou
//
//  Created by brady murphy on 12/16/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation
import PersonalityInsights
import SwiftUI


/**
 Observable data that allows application to keep track of the users information throughout the
 applications lifecycle (from start to termination). This will maintain the users profile preferences that are
 generated as well as maintaining inormation on what to show in the modal when presented.
 
 Since the object is a lifecycle object, it's intended use is an an environment variable that can be accessed
 by any view that needs to update the users data
 */
final class UserData: ObservableObject {
    
    /**
     States of laoding data
     */
    enum Loading {
        case tweets, personalityProfile, completed
    }
    
    /**
     Created profile from users tweets
     */
     var profile: Profile?
    
    /**
     String containing the twitter handle of the user
     */
    @Published var twitterHandle: String
    @Published var loading: Loading
    
    /**
     View to display to the user
     */
    @Published var viewDisplayed: Display
    
    /**
     Initialize the profile to nil. If the profile is nil after attempting to get the information from twitter, then the request is invalid
     */
    init() {
        self.profile = nil
        self.twitterHandle = ""
        
        self.viewDisplayed = .mainPage
        self.loading = .completed
    }

    /**
     Returns an array of consumption preferences by first mapping the categories into the preferences and then into their respective preferences
     */
    public func consumptionPreferences() -> [ConsumptionPreferences] {
        let categories = self.profile?.consumptionPreferences ?? [ConsumptionPreferencesCategory]()
        return categories.map{ $0.consumptionPreferences }.flatMap{ $0 }
    }
    
    /**
     Resets the user data to defaults to allow for future personality insight requests
     */
    public func reset() {
        self.viewDisplayed = .mainPage
        self.twitterHandle = ""
        self.loading = .completed
        self.profile = nil
    }
}
