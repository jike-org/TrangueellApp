//
//  TabView.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 12/05/22.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            ViewHome()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            DreamStatsView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                
        }.onAppear() {
            NotificationManager.instance.requestAuthorization()
            NotificationManager.instance.scheduleNotification()
            NotificationManager.instance.deleteNotification()
            
            UIApplication.shared.applicationIconBadgeNumber = 0
        
        }
    }
}
