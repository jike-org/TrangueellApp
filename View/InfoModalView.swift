//
//  InfoModalView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 31/05/22.
//

import SwiftUI

struct InfoModalView: View {
    @Binding var showInfo : Bool
    var body: some View {
        VStack {
            ForEach(infoList, id: \.self) { info in
                InfoOvalView(info: info)
                //                .padding(15)
            }
        }
//        .padding()
            .background(BackgroundView())
    }
}

//struct InfoModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoModalView()
//    }
//}
