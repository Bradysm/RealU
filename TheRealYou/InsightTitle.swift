//
//  InsightTitle.swift
//  TheRealYou
//
//  Created by brady murphy on 12/1/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

/**
 Titles used above card scroll cateogries
 */
struct InsightTitle: View {
    let title: String
    
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(.leading, 36)
        .offset(y: 10)
    }
}

struct InsightTitle_Previews: PreviewProvider {
    static var previews: some View {
        InsightTitle(title: "Preferences")
    }
}
