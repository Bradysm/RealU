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
    // user data env object
    @EnvironmentObject var userData: UserData
    
    @State var twitterHandle: String = ""
    @State var searched: Bool = false
    
    var body: some View {
        VStack {
            if self.userData.viewDisplayed == .mainPage {
                LoginPage()
                    .animation(.easeInOut(duration: 1))
            }
            else if self.userData.viewDisplayed == .loadingPage {
                LoadingPage()
            }
            else if self.userData.viewDisplayed == .insightPage {
                PersonalityProfile()
                
            }
            else if self.userData.viewDisplayed == .errorPage {
                ErrorPage()
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
