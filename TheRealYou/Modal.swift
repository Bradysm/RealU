//
//  Modal.swift
//  TheRealYou
//
//  Created by brady murphy on 11/28/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

struct Modal: View {
    @EnvironmentObject var modalData: ModalData
    
    var body: some View {
        
        ZStack {
            // set the white background
            Color.white
            
            VStack(alignment: .center) {
                self.generateContent()
                Spacer()
                
                // button to remove modal
                ModalButton(showModal: self.$modalData.showModal)
            }
            .frame(width: UIScreen.main.bounds.width - 156)
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: 350)
        .cornerRadius(36)
        .overlay(
            RoundedRectangle(cornerRadius: 36)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        
    }
}


extension Modal {
    
    /**
     Button used to close modal
     */
    struct ModalButton: View {
        @Binding var showModal: Bool
        
        var body: some View {
            // button to search a new handle
            Button(action: {
                self.showModal = false
                print("close modal")
            }) {
                Text("Close Insight")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.vertical, 16)
                    .frame(width: UIScreen.main.bounds.width - 156)
                    .realUButtonStyle()
            }
        }
    }
    
    
    /**
     Generates the modals content and reutrns a view containing the content for the modal
     */
    func generateContent() -> some View {
        return VStack(alignment: .leading) {
            
            Text("RealU Insight")
                .font(.title)
                .foregroundColor(Color("ButtonColor"))
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            ScrollView {
                // details header
                HStack {
                    Text("Details")
                        .font(.headline)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        
                    Spacer()
                }
                
                // detail
                HStack {
                  Text("\(self.modalData.detail)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                    .layoutPriority(1)
                    
                    Spacer()
                }
            }
            .frame(height: 175)
            
        } // end of VStack
        
    } // end of generate content
    
} // end of extension




struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal().environmentObject(ModalData())
    }
}
