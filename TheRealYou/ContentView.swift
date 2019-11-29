//
//  ContentView.swift
//  TheRealYou
//
//  Created by brady murphy on 11/27/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

/**
 Main view of the application
 */
struct ContentView: View {
    @State var twitterHandle: String = ""
    @State var searched: Bool = false
    
    var body: some View {
        VStack {
            if self.searched {
                IntelligenceScroll(continueViewing: self.$searched)
                    .animation(.easeInOut(duration: 1))
            } else {
                LoginPage(handle: self.$twitterHandle, showLogin: self.$searched)
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
