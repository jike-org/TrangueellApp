//
//  DreamView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 11/05/22.
//

import SwiftUI
import CoreData

struct DreamView: View {
    var dream: Dream
    
    var body: some View {
        Text("Dream at \(dream.dreamTitle!)")
        Text("\(dream.dreamDescription!)")
        Text("\(dream.dreamDate!.formatted())")
    }
}

