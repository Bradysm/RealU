//
//  ContentView.swift
//  TheRealYou
//
//  Created by brady murphy on 11/27/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

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

struct LoginPage: View {
    @Binding var handle: String
    @Binding var showLogin: Bool
    
    
    var body: some View {
        ZStack {
            Color("PastelPink")
                .edgesIgnoringSafeArea(.all)
            
            LoginCard(handle: self.$handle, searched: self.$showLogin)
                .padding(.horizontal, 36)
                .shadow(color: Color.gray.opacity(0.5), radius: 8)
            
        }.animation(.easeIn(duration: 0.3))
    }
}


struct LoginCard: View {
    @Binding var handle: String
    @Binding var searched: Bool
    
    
    var body: some View {
        VStack {
            Text("Enter Twitter Handle")
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .font(.headline)
                .multilineTextAlignment(.center)
            
            TextField("@elon", text: self.$handle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                .padding(.horizontal, 50)
            
            
            Button(action: {
                withAnimation(Animation.interpolatingSpring(mass: 4, stiffness: 10, damping: 40, initialVelocity: 8)) {
                    self.searched = !self.searched
                    
                    let _ = fetchRecentTweets(fromHandle: "elon")
                    print("searching twtitter")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
