//
//  ErrorPage.swift
//  TheRealYou
//
//  Created by brady murphy on 12/19/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

struct ErrorPage: View {
    var body: some View {
        ZStack {
            Color("PastelPink")
            ErrorCard()
                .shadow(color: Color.gray.opacity(0.5), radius: 8)
        }.edgesIgnoringSafeArea(.all)
        
    }
}


extension ErrorPage {
    
    
    
    
}


struct ErrorPage_Previews: PreviewProvider {
    static var previews: some View {
        ErrorPage().environmentObject(UserData())
    }
}
