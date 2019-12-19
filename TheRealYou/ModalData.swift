//
//  ModalData.swift
//  TheRealYou
//
//  Created by brady murphy on 12/17/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import Foundation
import SwiftUI


/**
 Observable object to be used throughout the application to allow for a custom modal
 This class will publish the showModal variable to trigger a rerendering of the view whenever
 the variable is updated. The data will also contain information on
 
 */
final class ModalData: ObservableObject {
    
    /**
     Published variable to show the modal on the screen. When updated to true
     the modal becomes shown
     */
    @Published public var showModal: Bool
    
    /**
     Data to be displayed in the modal
     */
    public var detail: String
    public var title: String
    public var image: ModalImage
    
    
    init() {
        self.showModal = false
        self.detail = "No Details Available"
        self.title = "Empty Title"
        self.image = .personality
    }
    
    /**
     Updates modal to contain a new detail with it's corresponding image
     
     @Param - str: String containing the modals new detail
     @Param - img: ModalImage type representing the image type to display on the modal
     */
    public func updateModal(title: String, str modalDetail: String, img modalImage: ModalImage) {
        self.title = title
        self.detail = modalDetail
        self.image = modalImage
    }
    
    
    /**
     resets the modal data to the default values
     */
    public func reset() {
        self.showModal = false
        self.detail = "No Details Available"
        self.title = "Empty Title"
    }
}
