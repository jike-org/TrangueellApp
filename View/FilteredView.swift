//
//  FilteredView.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 26/05/22.
//

import Foundation
import SwiftUI

struct FilteredView: View {
    @State var scale : CGFloat = 1
    @FetchRequest var filteredRequest: FetchedResults<DreamElement>

    var body: some View {
        ForEach (filteredRequest) { bubble in
            
            SingleBubbleView(bubble: bubble)
            
                .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
                .animation (Animation.spring (dampingFraction: 0.5)
                    .repeatForever()
                    .speed (.random(in: 0.05...0.4))
                    .delay(.random (in: 0...1)), value: scale
                )
            
            
                .position(x: .random(in: frameMinX+100...frameMaxX-100), y: .random(in: frameMinY+100...frameMaxY-100))
        }
    }
    
    init(filter: Category){
        _filteredRequest = FetchRequest<DreamElement>(sortDescriptors: [], predicate: NSPredicate(format: "category CONTAINS %@", filter.name))
    }
}
