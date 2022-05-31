//
//  BackgroundView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 30/05/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.customBG1, .customBG2,.customBG3], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
        }
    }
}

//struct BackgroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        BackgroundView()
//    }
//}
