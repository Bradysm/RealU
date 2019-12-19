//
//  RealUButtonStyle.swift
//  TheRealYou
//
//  Created by brady murphy on 12/19/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI


struct RealUButtonStyle: ViewModifier {
    
    /**
     Creates a button with a blue to green style and then adds shadows to the button
     The button also comes with vertical padding
     */
    func body(content: Content) -> some View {
        content
            //.background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor"), Color("PastelGreen")]), startPoint: .leading, endPoint: .trailing))
            .background(Color("ButtonColor"))
            .cornerRadius(18)
            .padding(.vertical, 20)
            .shadow(color: Color.gray.opacity(0.5), radius: 8)
    }
}

extension View {
    
    /**
     Creates  view extension of the modifier
     */
    func realUButtonStyle() -> some View {
        self.modifier(RealUButtonStyle())
    }
}
