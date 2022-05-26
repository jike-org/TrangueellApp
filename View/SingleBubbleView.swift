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
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DreamElement.text, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<DreamElement>
    
    @State private var showModal = false
    
    private func deleteBubble(_ item: DreamElement) {
        if let ndx = dreams.firstIndex(of: item) {
            viewContext.delete(dreams[ndx])
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func increaseBubble() {
        if bubbleDiameter == 200.0 {
            
        } else {
            bubbleDiameter += 25.0
            textSize += 4.0
        }
    }
    func decreaseBubble() {
        if bubbleDiameter == 75.0 {
            deleteBubble(bubble)
        } else if bubbleDiameter < 100.0{
            bubbleDiameter -= 25.0
        } else {
            bubbleDiameter -= 25.0
            textSize -= 4.0
        }
    }
    func bubbleConstraint() {
        
    }
    
    var body: some View {
        ZStack {
//            Circle()
            Image("bubble")
                .resizable()
            
            Text(bubble.text!)
                .font(.system(size: textSize))
                .foregroundColor(.white)
                .lineLimit(1)
            
            
        }
        .frame(width: bubbleDiameter, height: bubbleDiameter)
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
