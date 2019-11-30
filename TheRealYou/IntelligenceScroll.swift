//
//  IntellegenceScroll.swift
//  TheRealYou
//
//  Created by brady murphy on 11/28/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

struct IntelligenceScroll: View {
    @Binding var viewDisplayed: Display
    @State var showModal: Bool = false
    
    var body: some View {
        
        ZStack {
            ScrollView(showsIndicators: false) {
                
                // habits title
                CardScrollTitle(title: "Personality")
                HorizontalCardScroll(cardColor1: Color("PastelGreen"), cardColor2: Color("ButtonColor"), showModal: self.$showModal)
                
                CardScrollTitle(title: "Needs")
                    .padding(.top, 30)
                HorizontalCardScroll(cardColor1: Color("PastelPink"), cardColor2: Color("PastelYellow"), showModal: self.$showModal)
                
                
                CardScrollTitle(title: "Values")
                    .padding(.top, 30)
                HorizontalCardScroll(cardColor1: Color("ButtonColor"), cardColor2: Color.purple, showModal: self.$showModal)
                
                
                CardScrollTitle(title: "Consumer Preferences")
                    .padding(.top, 30)
                HorizontalCardScroll(cardColor1: Color("PastelYellow"), cardColor2: Color("PastelGreen"), showModal: self.$showModal)
                
                
                BackToHomeButton(viewDisplayed: self.$viewDisplayed)
            } // end of scroll view
            .blur(radius: self.showModal ? 6 : 0.0)
            
            
            if self.showModal {
                Modal(showModal: self.$showModal, content: Text("Showing Modal"))
                    .animation(.default)
            }
            
        }
    } // end of body
}

extension IntelligenceScroll {
    
    /**
     Button which updates the state of the UI to send the user back to the login page
     */
    struct BackToHomeButton: View {
        @Binding var viewDisplayed: Display
        
        var body: some View {
            // button to send the user back to the main page
            Button(action: {
                self.viewDisplayed = .mainPage
                print("clicked")
            }) {
                Text("Search New Handle")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color("ButtonColor"))
                    .cornerRadius(26)
                    .padding(50)
                    .shadow(color: Color.gray.opacity(0.5), radius: 8)
                
            }
        }
    }
    
    struct HorizontalCardScroll: View {
        //let cards: [Card] <-- array of cards to display
        let cardColor1: Color
        let cardColor2: Color
        @Binding var showModal: Bool
        
        var body: some View {
            // horizontal card scroll
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 40) {
                    ForEach(0..<5) { index in
                        GeometryReader { geometry in
                            IntelligenceCard(color1: self.cardColor1, color2: self.cardColor2)
                                .rotation3DEffect(Angle(degrees:
                                    (Double(geometry.frame(in: .global).minX) - 20) / -40)
                                    , axis: (x: 0, y: 10.0, z: 0.0)
                            )
//                                .onTapGesture {
//                                    self.showModal = true
//                            }
                        }.frame(width: 250, height:  450)
                        
                    }
                    
                    // this will push the last card
                    Capsule()
                        .foregroundColor(.white)
                        .background(Color.white)
                        .frame(width: 50, height: 250)
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 40)
            }
            .frame(width: UIScreen.main.bounds.width, height: 375)
        }
    }

    /**
     Titles used above card scroll cateogries
     */
    struct CardScrollTitle: View {
        let title: String
        
        var body: some View {
            HStack {
                Text("\(title)")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding(.leading, 36)
            .offset(y: 10)
        }
    }
    
    
}




struct IntelligenceScroll_Previews: PreviewProvider {
    static var previews: some View {
        IntelligenceScroll(viewDisplayed: .constant(.insightPage))
    }
}
