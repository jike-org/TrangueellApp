//
//  SingleBubbleView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 25/05/22.
//

import SwiftUI

struct SingleBubbleView: View {
    
    @State var bubbleDiameter : CGFloat = 100.0
    @State var textSize : CGFloat = 14.0
    @State var offset: CGSize = .zero
    //    var bubble : Bubble
    var bubble : DreamElement
    
    func increaseBubble() {
        if bubbleDiameter == 200.0 {
            
        } else {
            bubbleDiameter += 25.0
            textSize += 4.0
        }
    }
    func decreaseBubble() {
        if bubbleDiameter == 100.0 {
            
        } else {
            bubbleDiameter -= 25.0
            textSize -= 4.0
        }
    }
    func bubbleConstraint() {
        
    }
    
    var body: some View {
        ZStack {
            Circle()
            
            Text(bubble.text!)
                .font(.system(size: textSize))
                .lineLimit(1)
            
            
        }
        .frame(width: bubbleDiameter)
        .offset(offset)
        .onTapGesture(count: 2, perform:{ decreaseBubble()})
        .onTapGesture(count: 1, perform:{ increaseBubble()})
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.spring()) {
                        offset = value.translation
                    }
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        offset = value.translation
                    }
                }
        )
    }
}
