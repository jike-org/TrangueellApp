//
//  TabView.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 12/05/22.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DreamElement.text, ascending: true)],
        animation: .default)
    private var dreams: FetchedResults<DreamElement>
    
    var body: some View {
        List {
            ForEach(dreams) { dream in
                Text(dream.text!)
            }
            .onDelete(perform: deleteDreamElement)

        }
        

        
//        TabView {
//            ContentView()
//                .tabItem {
//                    Label("Menu", systemImage: "list.dash")
//                }
//
//            ViewHome()
//                .tabItem {
//                    Label("Order", systemImage: "square.and.pencil")
//                }
//            DreamStatsView()
//                .tabItem {
//                    Label("Profile", systemImage: "person.circle")
//                }
//
//        }.onAppear() {
//            NotificationManager.instance.requestAuthorization()
//            NotificationManager.instance.scheduleNotification()
//            NotificationManager.instance.deleteNotification()
//
//            UIApplication.shared.applicationIconBadgeNumber = 0
//
//        }
    }
    
    private func deleteDreamElement(offsets: IndexSet) {
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
