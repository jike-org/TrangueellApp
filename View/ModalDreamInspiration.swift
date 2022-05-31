//
//  ModalDreamInspiration.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 31/05/22.
//

import SwiftUI

struct ModalDreamInspiration: View {
    @Binding var showDreamInspiration : Bool
    var body: some View {
        VStack {
        Text("Dream Inspiration")
            .font(Font.custom("Avenir", size: 20))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding(.top, 50)
            Spacer()
            VStack(spacing: 10) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                Text("Delete All")
                    .font(Font.custom("Avenir", size: 15))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.bottom, 70)
            }
            .onTapGesture {
//                Remove all the Dream Signs
            }
        }
        .background(.clear)
        .ignoresSafeArea(.all)
    }
}

//struct ModalDreamInspiration_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalDreamInspiration()
//    }
//}
