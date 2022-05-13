//
//  RandomData.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 13/05/22.
//

import Foundation

struct Notification {
    var title: String
    var text: String
}

var notif1 = Notification.init(title: "jughow", text: "hello hello hello")
var notif2 = Notification.init(title: "RuPaul", text: "bye bye bye")
var notif3 = Notification.init(title: "Lipsync for your life", text: "and don't fuck it up")

var notifications: [Notification] = [notif1, notif2, notif3]
