//
//  InfoModalView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 31/05/22.
//

import SwiftUI

struct ModalViewInfo: View {
    
    @Binding var showInfo : Bool
    let layout = [GridItem(.flexible())]
    
    var body: some View {
//        VStack {
        LazyVGrid(columns: layout, spacing: 5) {
            ForEach(infoList, id: \.self) { info in
                InfoOvalView(info: info)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
            }
            .background(.clear)
            .ignoresSafeArea(.all)
        }
        
    }
}

//struct InfoModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoModalView()
//    }
//}
