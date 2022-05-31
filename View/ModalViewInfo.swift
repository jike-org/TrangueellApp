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
        
        ZStack {
            BackgroundView()
                .ignoresSafeArea()
            LazyVGrid(columns: layout, spacing: 10) {
                ForEach(infoList, id: \.self) { info in
                    InfoOvalView(info: info)
                        .padding(.trailing, 20)
                        .padding(.leading, 20)
                }
                
            }
        }
    }
}

