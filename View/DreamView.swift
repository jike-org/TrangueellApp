//
//  DreamView.swift
//  TrangueellApp
//
//  Created by Raffaele Siciliano on 11/05/22.
//

import SwiftUI
import CoreData

struct DreamView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var dream: Dream
    @State var dreamText: String
    
    var body: some View {
        VStack{
            Text("Dream at \(dream.dreamTitle!)")
            TextField("", text: $dreamText)
                .onChange(of: dreamText) { newValue in
                    updateItem()
                }
            Text("\(dream.dreamDate!.formatted())")
        }
        .padding()
    }
    
    private func updateItem(){
        withAnimation {
            dream.dreamDescription = dreamText
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

