//
//  Modal.swift
//  TheRealYou
//
//  Created by brady murphy on 11/28/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import SwiftUI

struct Modal<Content: View >: View {
    @Binding var showModal: Bool
    let content: Content // content of the modal
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                .shadow(color: Color.gray.opacity(0.4), radius: 4)
            
            ScrollView {
                content
            }.padding(.vertical, 40)
            
            VStack {
                Spacer()
                ModalButton(showModal: self.$showModal)
            }.padding(.vertical)
            
        }
        .padding(50)
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
                    .padding()
                    .background(Color("ButtonColor"))
                    .cornerRadius(26)
                    .padding(50)
                    .shadow(color: Color.gray.opacity(0.5), radius: 8)
                
            }
        }
    }
    
    
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal(showModal: .constant(false), content: Text("Content"))
    }
}
