//
//  CardContent.swift
//  TheRealYou
//
//  Created by brady murphy on 12/18/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation


/**
 Protocol for Content on cards. All data that is used within a card must implement these functions
 */
protocol CardContent {
    
    /**
     Gets the name of the content
     */
    func getName() -> String
    
    /**
     Gets the string representation of the content
     */
    func getDetails() -> String
    
    /**
     Gets the main headline for content
     */
    func getHeadline() -> String
    
    /**
     Returns the modal image to be displayed when the card is clicked
     */
    func modalImage() -> ModalImage
}
