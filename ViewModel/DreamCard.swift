//
//  DreamCard.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 24/05/22.
//

import Foundation
import SwiftUI

struct DreamCard: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var category: Category
    @State var isCreated: Bool = false
    @State var createdDream: DreamElement = DreamElement()
    
    @State var text_field: String = ""

            
    var body: some View{
        HStack{
            Image(category.icon)
            TextField(category.name, text: $text_field)
                .onChange(of: text_field) { newValue in
                    if isCreated == false {
                        createdDream = addDreamElement()
                        isCreated = true
                    } else {
                        updateDreamElement()
                    }
                }
        }
    }
    
    private func addDreamElement() -> DreamElement{
        withAnimation {
            let newDreamElement = DreamElement(context: viewContext)
            newDreamElement.category = category.name
            newDreamElement.text = text_field
            newDreamElement.date = Calendar.current.date(from: DateComponents())
            newDreamElement.bubbleDiameter = 100.0
            newDreamElement.positionX = 300
            newDreamElement.positionY = 300
            newDreamElement.textSize = 14.0
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            return newDreamElement
        }
    }
    
    private func updateDreamElement(){
        withAnimation {
            createdDream.text = text_field
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
