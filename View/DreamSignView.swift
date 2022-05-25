//
//  DreamSignView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 25/05/22.
//

import SwiftUI

struct DreamSignView : View {
    @State var scale : CGFloat = 1
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DreamElement.text, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<DreamElement>
    
    @State private var showModal = false
    
    private func deleteItems2(_ item: DreamElement) {
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
    
    let darkBlue = Color(red: 0.11, green: 0.11, blue: 0.39)
    let bubbleColor = Color (red: 0.65, green: 1.05, blue: 2.25)
    var body: some View {
        
        VStack {
            ZStack {
                ForEach (dreams) { bubble in
                    
                    SingleBubbleView(bubble: bubble)
                        .onLongPressGesture(minimumDuration: 1.5, perform: {deleteItems2(bubble)})
                        .foregroundColor(bubbleColor).opacity(0.4)
                    
                        .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
                        .animation (Animation.spring (dampingFraction: 0.5)
                            .repeatForever()
                            .speed (.random(in: 0.05...0.4))
                            .delay(.random (in: 0...1)), value: scale
                        )
                    
                    
                        .position(x: .random(in: frameMinX+100...frameMaxX-100), y: .random(in: frameMinY+100...frameMaxY-100))
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showModal.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        })
                        .sheet(isPresented: $showModal){
                            ModalAddDream(showModal: $showModal)
                        }
                        .padding(.trailing, 30)
                        .padding(.top, 45)
                    }
                    Spacer()
                }
                
            }
            
            .drawingGroup(opaque: false, colorMode: .linear)
            .background(
                Rectangle()
                    .foregroundColor(darkBlue))
            .ignoresSafeArea()
        }
    }
    
}

struct DreamSignView_Previews: PreviewProvider {
    static var previews: some View {
        DreamSignView()
    }
}
