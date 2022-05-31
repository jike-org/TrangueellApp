//
//  InfoOvalView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 31/05/22.
//

import SwiftUI

struct InfoOvalView: View {
    @State var info : Info
    var body: some View {
        ZStack {
            Image("Oval")
                .resizable()
                .scaledToFit()
            VStack {
                Text(info.title)
                    .font(Font.custom("Avenir", size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(info.description)
                    .font(Font.custom("Avenir", size: 18))
                    .foregroundColor(.white)
            }
            
//            .padding(10)
        }
    }
}

//struct InfoOvalView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoOvalView()
//    }
//}
