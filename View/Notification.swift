//
//  Notification.swift
//  TrangueellApp
//
//  Created by Davide Belardi on 13/05/22.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager() //singleton
    
    let options : UNAuthorizationOptions = [.alert, .sound, .badge] //opzioni che invierà all'app
    
    //funzione per richiedere i permessi all'utente
    func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                //se l'utente non accetta lancerà questo errore
                print("ERROR: \(error)")
                
            } else {
                //altrimenti succede questo
                print("SUCCESS")
            }
        }
    }
    
    //funzione per generare la notifica programmata
    func scheduleNotification(){
        
        let content = UNMutableNotificationContent() //possiamo avere il contenuto e modificarlo
        //questi perametri sotto li possiamo mettere perché .sound e .badge sono messi prima in options
        content.title = "Ciao ktm"
        content.subtitle = "ciao zia"
        content.sound = .default
        content.badge = 1
        
        
        //in caso di trigger -->
        //time (in questo caso non si ripete che ogni 5 secondi avviene la notifica
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60.0, repeats: true)
        //ma è possibile anche fare trigger per :
        //calendar
//        var dateComponents = DateComponents()
        //facendo così ogni volta alle 1.19 si verifica la notifica programmata con hour + min
//        dateComponents.hour = 14
//        dateComponents.minute = 45
//        dateComponents.weekday = 1 //1 domenica - 2 lunedì - 3 martedì - 4 giovedì - 5 venerdì - 6 sabato
        //se usi hour + minute + weekday si traduce in : Ogni domenica alle 1.19 si verificherà la notifica
        
//        let coordinates = CLLocationCoordinate2D(
//            latitude: 40.0,
//            longitude: 50.0
//        )
//
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 100,
//            identifier: UUID().uuidString
//        )
//
//        //ogni volta che si passa per quella data regione tramite region si azionerà la notifica
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
//
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        //location

        let request = UNNotificationRequest(
            identifier: UUID().uuidString, //assegno id alla notifica
            content: content, //un corpo
            trigger: trigger) //quando deve attivarsi la notifica

        UNUserNotificationCenter.current().add(request)
        
        
    }
    
    func deleteNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications() //se vuoi eliminarle dall'iPhone direttamente
        
    }
}

struct LocalNotification: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission"){
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notiication"){
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel notiication"){
                NotificationManager.instance.deleteNotification()
            }
        }.onAppear(){
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}
