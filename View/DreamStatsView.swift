//
//  DreamStatsView.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 13/05/22.
//

import SwiftUI

struct DreamStatsView: View {

    @State var nickname_user : String = ""
    
    var body: some View {
        TextField("Inserisci nickname", text: $nickname_user)
            .padding(40)
            .frame(width: UIScreen.main.bounds.width/1)
    }
    
  
}

