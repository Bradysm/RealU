//
//  LoginCard.swift
//  TheRealYou
//
//  Created by brady murphy on 11/29/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

/**
 Main card used to get the users twitter handle
 This view will display a text field that will allow the user to enter in their handle and then click search
 This will update the user data environment object to now contain the handle of the textfield
 */
struct LoginPage: View {
    
    var body: some View {
        ZStack {
            Color("PastelPink")
                .edgesIgnoringSafeArea(.all)
            LoginCard()
                .padding(.horizontal, 36)
                .shadow(color: Color.gray.opacity(0.5), radius: 8)
            
        }.animation(.easeIn(duration: 0.3))
    }
}



extension LoginPage {
    
    /**
     Card that is used for the login page
     The card has one text field allowing the user to type in the twitter handle to be analyzed
     
     When the button is clicked, the handle variable is updated with the textfield handle and searched becomes toggled
     */
    struct LoginCard: View {
        @State var searched = false
        
        // get the user data from the environment
        @EnvironmentObject var userData: UserData
        
        
        var body: some View {
            VStack {
                Text("Enter Twitter Handle")
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                TextField("@elon", text: self.$userData.twitterHandle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .padding(.horizontal, 50)
                
                
                Button(action: {
                    withAnimation(Animation.interpolatingSpring(mass: 4, stiffness: 10, damping: 40, initialVelocity: 8)) {
                        self.userData.viewDisplayed = .loadingPage
                        self.userData.loading = .tweets
                        // call the API's to get the data
                        DispatchQueue.global().async {
                            // get the tweets
                            let tweets = fetchRecentTweets(fromHandle: self.userData.twitterHandle)
                            DispatchQueue.main.async {
                                guard !tweets.isEmpty else { self.userData.viewDisplayed = .errorPage; return }
                                self.userData.loading = .personalityProfile
                            }
                            
                            guard !tweets.isEmpty else { return }
                            self.userData.profile = fetchPersonalityInsightsFromTweets(tweets)
                            DispatchQueue.main.async {
                                self.userData.viewDisplayed = .insightPage
                            }
                        }
                    }
                }) {
                    Text("Know the RealU") 
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        
                        .background(Color("ButtonColor"))
                        .cornerRadius(18)
                        .padding(.top)
                        .shadow(radius: 2)
                    
                }
                .scaleEffect(self.searched ? 1.2: 1.0)
                .padding(.top, 18)
                
            }
            .padding(.vertical, 32)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(36)
        }
    }
    
}



struct LoginCard_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage().environmentObject(UserData())
    }
}
