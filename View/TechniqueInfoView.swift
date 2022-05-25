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
                Text("Lorem ipsum")
                    .foregroundColor(.white)
            }
        }.padding()
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                )
        
    }
}
