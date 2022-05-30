//
//  DreamElement+CoreDataProperties.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 26/05/22.
//
//

import Foundation
import CoreData


extension DreamElement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DreamElement> {
        return NSFetchRequest<DreamElement>(entityName: "DreamElement")
    }

    @NSManaged public var category: String?
    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var bubbleDiameter: Float
    @NSManaged public var textSize: Float
    @NSManaged public var positionX: Int
    @NSManaged public var positionY: Int
    @NSManaged public var isCollected: DreamCollection?

}

extension DreamElement : Identifiable {

}
