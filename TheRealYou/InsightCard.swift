//
//  IntelligenceCard.swift
//  TheRealYou
//
//  Created by brady murphy on 11/28/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI
import PersonalityInsights


struct InsightCard: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var modalData: ModalData
    
    let color1: Color
    let color2: Color
    let content: CardContent
    
    var body: some View {
        VStack {
            // gradient
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottom)
                .frame(height: 225)
            
            // content
            VStack {
                // card headline
                HStack {
                    Text("\(content.getHeadline())")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                // name of the content
                HStack {
                    Text("\(content.getName())")
                        .font(.title)
                        .fontWeight(.black)
                        .lineLimit(2)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
            }
            .padding([.top, .bottom])
            .padding(.horizontal, 26)
            
        }
        .cornerRadius(36)
        .overlay(
            RoundedRectangle(cornerRadius: 36).stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
            .frame(width: 275)
            .shadow(color: Color.gray.opacity(0.5), radius: 8)
            .onTapGesture() {
                withAnimation {
                    if !self.modalData.showModal { // only update if a modal isn't currently up
                        self.modalData.updateModal(title: self.content.getName(), str: self.insightDetail(), img: .consumption)
                        self.modalData.showModal.toggle()
                    }
                }
        }
    } // end of body
}


extension  InsightCard {
    
    /**
     Generates detailed text describing the insight for ther user
     */
    func insightDetail() -> String {
        return "@\(userData.twitterHandle) \(content.getDetails())"
    }
}

