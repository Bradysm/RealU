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
                Text(self.userData.loading == .tweets ? "Fetching Tweets" : "Generating Personality Data")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 125)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            
            Loader()
        }
    }
}

extension LoadingPage {
    
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
