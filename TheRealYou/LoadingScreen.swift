//
//  LoadingScreen.swift
//  TheRealYou
//
//  Created by brady murphy on 12/16/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI
import NVActivityIndicatorView

struct LoadingPage: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            Color("PastelPink")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                LoadingStatusCard(status: self.$userData.loading)
                    .padding(.top, 50)
                
                Spacer()
            }
            
            Loader()
        }
    }
}

extension LoadingPage {
    
    
    /**
     Card displayed contiaing the loading status of the RealU profile
     */
    struct LoadingStatusCard: View {
        @Binding var status: LoadingStatus
        
        var body: some View {
            VStack {
                Text(self.status == .tweets ? "Fetching Tweets" : "Generating RealU Profile")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding(.vertical, 32)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.5), radius: 8)
        }
    }
    
    /**
     Wrapper view to interface UIKit with SwiftUI view
     Creates a SwiftUI view for the UIKit loading screen
     */
    struct Loader: UIViewControllerRepresentable {
        typealias UIViewControllerType = ActivityIndicatorViewController
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoadingPage.Loader>) -> ActivityIndicatorViewController {
            return ActivityIndicatorViewController()
        }
        
        func updateUIViewController(_ uiViewController: ActivityIndicatorViewController, context: UIViewControllerRepresentableContext<LoadingPage.Loader>) {
            // nothing here
        }
        
    }
    
}


struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        userData.twitterHandle = "stoolpresidente"
        return LoadingPage().environmentObject(userData)
    }
}
