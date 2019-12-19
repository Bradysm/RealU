//
//  ErrorCard.swift
//  TheRealYou
//
//  Created by brady murphy on 12/19/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

struct ErrorCard: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        ZStack {
            // set the white background
            Color.white
            
            VStack {
                Text("Twitter Error")
                    .font(.title)
                    .foregroundColor(Color("ButtonColor"))
                    .fontWeight(.black)
                    .padding(.vertical)
                
                Text("There was an error retrieving tweets from the twitter handle:")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    
                Text("@\(self.userData.twitterHandle)")
                    .font(.headline)
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.bottom)
                
                
                Text("Please make sure that the twitter handle is spelled correctly and is not a private account. Due to access restrictions, private accounts can not be used for RealU profiling.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    
                Spacer()
                // button to remove modal
                ErrorBackButton()
            }
            .padding(.horizontal, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: 400)
        .cornerRadius(36)
        .overlay(
            RoundedRectangle(cornerRadius: 36)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
            .padding(.horizontal)
        
    }
}


extension ErrorCard {
    
    /**
     Button used to close error page
     */
    struct ErrorBackButton: View {
        @EnvironmentObject var userData: UserData
        
        var body: some View {
            // button to search a new handle
            Button(action: {
                self.userData.reset()
                self.userData.viewDisplayed = .mainPage
            }) {
                Text("Back to home")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor"), Color("PastelGreen")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(26)
                    .padding(.vertical, 20)
                    .shadow(color: Color.gray.opacity(0.5), radius: 8)
                
            }
        }
    } // end of back buttonstruct ErrorCard: View {
}

struct ErrorCard_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        userData.twitterHandle = "adasdsadasds"
        return ErrorCard().environmentObject(userData)
    }
}
