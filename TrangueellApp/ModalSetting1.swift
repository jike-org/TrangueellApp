//
//  ModalSetting1.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 10/05/22.
//

import SwiftUI

struct ModalSetting1: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var showModal: Bool
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dream.dreamTitle, ascending: true)],
        animation: .default)
    
    private var dreams: FetchedResults<Dream>
    
    
    @State var text: String = ""
    @State var text_desc : String = ""
    @State var date_dream = Date()
    
    @State var disabled_button : Bool = true
    
    let dateFormatter = DateFormatter()

    var body: some View {
        VStack {
            TextField("Title", text: $text)
                .padding(40)
                
            TextEditor(text: $text_desc)
                .foregroundColor(.secondary)
                .navigationTitle("What's your dream?")
                .padding(20)
            
            DatePicker(selection: $date_dream, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
                
            }.padding(40)
            
                Button("Add dream") {
                    addItem()
                    self.showModal.toggle()
                }.frame(width: UIScreen.main.bounds.width/2 , height: 50)
                .background(text.isEmpty || text_desc.isEmpty ? .gray : .blue)
                .foregroundColor(.black)
                .cornerRadius(20)
                .disabled(text.isEmpty || text_desc.isEmpty)
         
            
                
            
            Spacer()
        }
    }
    
    private func addItem() {
        withAnimation {
            let newDream = Dream(context: viewContext)
            newDream.dreamTitle = text
            newDream.dreamDescription = text_desc
            newDream.dreamDate = date_dream
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
}


