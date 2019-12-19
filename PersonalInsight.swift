//
//  PersonalInsight.swift
//  TheRealYou
//
//  Created by brady murphy on 12/1/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI
import PersonalityInsights

/**
 Represents row of insight for the viewer
 This will contain a scroll view of cards
 The view is a dropdown view that allows the user to click on the dropdown to show the cards
 
 Insight: generic representing insight Data. Any data that conforms to CardContent and Hashable can be used within the personal insight
    - this is used incase there is any future expansions within IBM watson and more insight data types can be produced
 */
struct PersonalInsight<Insight: Hashable & CardContent>: View {
    @Binding var showCards: Bool
    let insightTitle: String
    let color1: Color // first color of the gradient
    let color2: Color // second color for gradient
    let insights: [Insight] // this is going to contain the array of insights
    
    
    var body: some View {
        VStack {
            // title above cards
            HStack(alignment: .center) {
                InsightTitle(title: self.insightTitle)
                Spacer()
                Image(systemName: "chevron.down.circle")
                    .imageScale(.medium)
                    .font(Font.title.weight(.medium))
                    .rotationEffect(self.showCards ? Angle(degrees: 180) : Angle(degrees: 0))
                    .foregroundColor(self.showCards ? Color("ButtonColor") : .primary)
                    .onTapGesture {
                        withAnimation(Animation.spring()) { self.showCards.toggle() }
                }
                .padding(.trailing)
            }
            if self.showCards {
                InsightCardScroll(color1: self.color1, color2: self.color2, insights: self.insights)
            }
        }
    } // end of VStack
}



extension PersonalInsight {
    
    /**
     Horizontal scroll view encapsulatingt the view's cards
     The cards utilize a geometry reader to show animation as they're scrolled
     
     @Binding- showModal: Boolean representation of whether a modal should be shown to display more details on the card
     color(s): colors used in diagonal fade of cards
     */
    struct InsightCardScroll<Content: Hashable & CardContent> : View {
        let color1: Color
        let color2: Color
        let insights: [Content]
        
        var body: some View {
            
            ScrollView(.horizontal, showsIndicators: false ) {
                HStack(spacing: 40) {
                    
                    ForEach(insights, id: \.self) { insight in
                        GeometryReader { geometry in
                            InsightCard(color1: self.color1, color2: self.color2, content: insight)
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 20) / -40), axis: (x: 0, y: 10.0, z: 0.0) )
                        }.frame(width: 250, height: 390)
                    }
                    
                    // this will push the last card
                    Capsule()
                        .foregroundColor(.clear)
                        .background(Color.clear)
                        .frame(width: 50)
                    
                } // end of HStack
                .padding(40)
            }
            .frame(width: UIScreen.main.bounds.width, height: 375)
            
        } // end of body
    } // end of InsightCardScroll

}

//
//struct PersonalInsight_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalInsight(showCards: .constant(false), insightTitle: "Preferences", color1: Color("PastelGreen"), color2: Color("ButtonColor"))
//    }
//}
