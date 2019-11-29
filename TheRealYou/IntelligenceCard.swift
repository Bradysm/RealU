//
//  IntelligenceCard.swift
//  TheRealYou
//
//  Created by brady murphy on 11/28/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

struct IntelligenceCard: View {
    let color1: Color
    var color2: Color
    
    var body: some View {
        VStack {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottom)
                
                
            }
            .frame(height: 250)
            
            
            VStack {
                HStack {
                    Text("Score: 0.98")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                HStack {
                    Text("Intelligence")
                        .font(.title)
                        .fontWeight(.black)
                    .lineLimit(2)
                        .foregroundColor(.primary)
                    Spacer()
                }
                
                
            }
            .padding(.top)
            .padding( [.horizontal, .bottom], 26)
        }
        .cornerRadius(36)
        .overlay(
            RoundedRectangle(cornerRadius: 36).stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
        .frame(width: 275)
        .shadow(color: Color.gray.opacity(0.5), radius: 8)
    }
}

struct IntelligenceCard_Previews: PreviewProvider {
    static var previews: some View {
        IntelligenceCard(color1: Color("PastelGreen"), color2: Color("ButtonColor"))
    }
}
