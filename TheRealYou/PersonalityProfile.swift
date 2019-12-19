//
//  PersonalityProfile.swift
//  TheRealYou
//
//  Created by brady murphy on 12/1/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import PersonalityInsights
import SwiftUI

/**
 Display of the users personality profile. This profile will display the traits that were infered
 from the users most recent tweets.
 
 @viewDiaplyed: binding variable allowing the content to change based on the state of what is to be displayed. Used for back button
 @State ShowModal: state to display the modal or not
 */
struct PersonalityProfile: View {
    /**
     Environment objects allowing the update of the global state data
     */
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var modalData: ModalData
    
    // opening of personal insight
    @State var personalityOpen: Bool = true
    @State var needsOpen: Bool = false
    @State var valuesOpen: Bool = false
    @State var consumptionOpen: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                PersonalInsight(showCards: self.$personalityOpen, insightTitle: "Personality", color1: Color("PastelGreen"), color2: Color("ButtonColor"),
                                insights: self.userData.profile?.personality ?? [Trait]())
                PersonalInsight(showCards: self.$needsOpen, insightTitle: "Needs", color1: Color("PastelPink"), color2: Color("PastelYellow")
                    ,  insights: self.userData.profile?.needs ?? [Trait]())
                PersonalInsight(showCards: self.$valuesOpen, insightTitle: "Values", color1: Color("ButtonColor"), color2: Color.purple
                    ,  insights: self.userData.profile?.values ?? [Trait]())
                
                PersonalInsight(showCards: self.$consumptionOpen, insightTitle: "Consumption", color1: Color("PastelYellow"), color2: Color("PastelGreen"),
                                insights: self.userData.consumptionPreferences())
                
                HomeButton()
            }
                .blur(radius: self.modalData.showModal ? 6 : 0.0) // blur background if modal is being shown
                .animation(.easeInOut(duration: 0.5))
            
            
            
            if self.modalData.showModal {
                Modal()
                    .transition(.move(edge: .bottom))
            }
        }
    }
}


extension PersonalityProfile {
    
    
    /**
     Button which updates the state of the UI to send the user back to the login page
     */
    struct HomeButton: View {
        @EnvironmentObject var userData: UserData
        @EnvironmentObject var modalData: ModalData
        
        var body: some View {
            // button to send the user back to the main page
            Button(action: {
                // take them to home view if the modal is not up currently
                if !self.modalData.showModal {
                    self.userData.reset()
                    self.modalData.reset()
                }
            }) {
                HStack {
                    Spacer()
                    Text("Search New Handle")
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                }
                .padding(.vertical)
                .realUButtonStyle()
                .padding(.horizontal, 40)
                .padding(.top)
                
            }
        }
    }
    
}

struct PersonalityProfile_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityProfile().environmentObject(UserData()).environmentObject(ModalData())
    }
}
