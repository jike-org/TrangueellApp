//
//  SingleBubbleView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 25/05/22.
//

import SwiftUI

struct SingleBubbleView: View {
    
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
    
    private func increaseBubble(_ item: DreamElement) {
        if dreams.firstIndex(of: item) != nil {
            if bubble.bubbleDiameter == 200.0 {
                
            } else {
                bubble.bubbleDiameter += 25.0
                bubble.textSize += 4.0
            }
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
    
    private func decreaseBubble(_ item: DreamElement) {
        if dreams.firstIndex(of: item) != nil {
            if bubble.bubbleDiameter == 75.0 {
                deleteBubble(bubble)
            } else if bubble.bubbleDiameter < 100.0{
                bubble.bubbleDiameter -= 25.0
            } else {
                bubble.bubbleDiameter -= 25.0
                bubble.textSize -= 4.0
            }
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
    
    
    func bubbleConstraint() {
        
    }
    
    var body: some View {
        ZStack {
            //            Circle()
            Image("bubble")
                .resizable()
            
            Text(bubble.text!)
                .font(.system(size: CGFloat(bubble.textSize)))
                .foregroundColor(.white)
                .lineLimit(1)
            
            
        }
        .frame(width: CGFloat(bubble.bubbleDiameter), height: CGFloat(bubble.bubbleDiameter))
        .offset(offset)
        .onTapGesture(count: 2, perform:{decreaseBubble(bubble)})
        .onTapGesture(count: 1, perform:{increaseBubble(bubble)})
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
