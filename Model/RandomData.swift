//
//  RandomData.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 13/05/22.
//

import Foundation
import SwiftUI

struct Notification {
    var title: String
    var text: String
}

var notif1 = Notification.init(title: "jughow", text: "hello hello hello")
var notif2 = Notification.init(title: "RuPaul", text: "bye bye bye")
var notif3 = Notification.init(title: "Lipsync for your life", text: "and don't fuck it up")

var notifications: [Notification] = [notif1, notif2, notif3]

struct Category : Hashable {
    var name: String
    var icon: String
}

var person = Category.init(name: "person", icon: "person")
var animal = Category.init(name: "animal", icon: "pawprint")
var object = Category.init(name: "object", icon: "puzzlepiece")
var place = Category.init(name: "place", icon: "map")
var action = Category.init(name: "action", icon: "person.and.arrow.left.and.arrow.right")

var categories = [person, animal, object, place, action]

let frameMinX = UIScreen.main.bounds.minX
let frameMaxX = UIScreen.main.bounds.maxX
let frameMinY = UIScreen.main.bounds.minY
let frameMaxY = UIScreen.main.bounds.maxY
