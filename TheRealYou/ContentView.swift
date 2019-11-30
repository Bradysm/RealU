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
    @State var viewDisplayed: Display = .mainPage
    
    var body: some View {
        VStack {
            if self.viewDisplayed == .mainPage {
                LoginPage(handle: self.$twitterHandle, viewDisplayed: self.$viewDisplayed)
            }
            else if self.viewDisplayed == .loadingPage {
                Text("Loading Page")
            }
            else if self.viewDisplayed == .insightPage {
                IntelligenceScroll(viewDisplayed: self.$viewDisplayed)
                    .animation(.easeInOut(duration: 1))
            }
            else if self.viewDisplayed == .errorPage {
                Text("Error Page")
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
