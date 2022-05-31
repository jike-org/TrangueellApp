//
//  AreUDreamingView.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 30/05/22.
//

import Foundation
import SwiftUI

struct AreUDreamingView: View {
    
    @State var isAnimating = false

    var body: some View{
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            Text("Bitch, \nare u dreaming?")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 30))
                .opacity(self.isAnimating ? 0.0 : 1)
                .animation(Animation.linear(duration: 5).repeatForever())
                .onAppear {
                    self.isAnimating = true
                }
             
        }

    }
    
}
