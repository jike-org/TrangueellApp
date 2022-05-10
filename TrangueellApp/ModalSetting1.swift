//
//  ModalSetting1.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 10/05/22.
//

import Foundation
import SwiftUI

struct ModalSetting1: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var showModal: Bool
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dream.dreamTitle, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<Dream>
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Title", text: $text)
                .padding()
            Spacer()
            Button("Dismiss") {
                addItem()
                self.showModal.toggle()
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newDream = Dream(context: viewContext)
            newDream.dreamTitle = text

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
