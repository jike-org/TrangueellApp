//
//  ContentView.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 10/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showModal = false

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dream.dreamTitle, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<Dream>

    let formatter1 = DateFormatter()

    var body: some View {
        NavigationView {

            VStack{
            if dreams.count != 0 {
            List {
                ForEach(dreams) { dream in
                    NavigationLink {
                        DreamView(dream: dream, dreamText: dream.dreamDescription!)
                    } label: {
                        Text(dream.dreamTitle!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
                
            } else {
                    Image("sleep_analysis")
                        .resizable()
                        .scaledToFit()
                        
                    Text("There's no dreams, just start!").font(.system(size: 20, weight: .bold))
                
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        self.showModal.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }.sheet(isPresented: $showModal){
                        ModalSetting1(showModal: self.$showModal)
                }
                }
            }
            
            Text("Select an item")
        }.navigationViewStyle(.stack)
    }

    private func addItem() {
        withAnimation {
            let newDream = Dream(context: viewContext)
            newDream.dreamTitle = "Banana o nana"

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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { dreams[$0] }.forEach(viewContext.delete)

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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
