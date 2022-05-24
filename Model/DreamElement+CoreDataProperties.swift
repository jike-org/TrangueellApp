//
//  DreamElement+CoreDataProperties.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 23/05/22.
//
//

import Foundation
import CoreData


extension DreamElement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DreamElement> {
        return NSFetchRequest<DreamElement>(entityName: "DreamElement")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?
    @NSManaged public var category: String?
    @NSManaged public var isCollected: DreamCollection?

}

extension DreamElement : Identifiable {

}
