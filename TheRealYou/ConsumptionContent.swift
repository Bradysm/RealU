//
//  ConsumptionContent.swift
//  TheRealYou
//
//  Created by brady murphy on 12/18/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation
import PersonalityInsights

/**
 Extends consumption preferences to allow for the data to be presented on a card
 */
extension ConsumptionPreferences: CardContent {
    
    /**
     Gets the name of the content
     */
    func getName() -> String {
        return self.name
    }
    
    /**
     gets content details for modal
     */
    func getDetails() -> String {
        let likeliness = likelyToConsume()
        let consumeAction = likeliness == -1 ? "are not" : (likeliness == 1 ? "are" : "are potentially")
        return "received a consumption score of \(self.score), meaning they \(consumeAction) \(self.name.lowercased())."
    }
    
    /**
     gets contents headline
     */
    func getHeadline() -> String {
        let likeliness = likelyToConsume()
        let consumeAction = likeliness == -1 ? "No" : (likeliness == 1 ? "Yes" : "Maybe")
        return "Likely to consume: \(consumeAction)"
    }
    
    /**
     returns the ModalImage enum representing the image to display on the modal
     */
    func modalImage() -> ModalImage{
        return ModalImage.consumption
    }
    
    /**
     Returns an integer representing whether the user is likely to consume the product
     @Return: -1 if not likely, 0 meaning maybe, and 1 representing they're likely to consume it
     */
    private func likelyToConsume() -> Int {
        let intScore = Int(self.score * 10) // get the integer representaiion
        if intScore == 0 {
            return -1
        } else if intScore == 5 {
            return 0
        } else {
            return 1
        }
    }
    
}
