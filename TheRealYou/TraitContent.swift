//
//  TraitContent.swift
//  TheRealYou
//
//  Created by brady murphy on 12/18/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation
import PersonalityInsights

/**
 Extension of trait to follow the CardContent protocol
 */
extension Trait: CardContent {
    
    /**
     Gets the name of the content displayed on the card
     
     @Return: String representing the contents name
     */
    func getName() -> String {
        return self.name
    }
    
    /**
     Gets the details of the content and returns it in string format
     
     @Return: String representing card's deteails
     */
    func getDetails() -> String {
        let percentile = Int((self.percentile * 100).rounded())
        return "scored in the \(percentile) percentile for \(self.name.capitalized)!"
    }
    
    /**
     Gets the string version of the content headline
     
     @Return: String representing card headline
     */
    func getHeadline() -> String {
        let percentage = self.percentile * 100
        return String(format: "Percentile: %.3f", percentage)
    }
    
    /**
     Returns the enum representing the modal image to be displayed
     
     @return - ModalImage enum
     */
    func modalImage() -> ModalImage{
        if self.name == "Personality" {
            return .personality
        } else if self.name == "Needs" {
            return .needs
        } else {
            return .values
        }
    }
    
    
}
