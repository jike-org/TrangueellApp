//
//  TechniqueInfoView.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 25/05/22.
//

import SwiftUI

struct TechniqueView : View {
    
    @Binding var isPresentedFullScreenCover : Bool

    var body: some View {
        
        ZStack{
            Image("squarebubble")
            VStack{
                HStack{
                    Spacer()
                    Button {
                        isPresentedFullScreenCover = true
                    } label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
     
                }
                Spacer()
                Text("Lorem ipsum")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .frame(width: 100, height: 100)
        
       
//            .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(.blue, lineWidth: 4)
//                )
        
    }
}
