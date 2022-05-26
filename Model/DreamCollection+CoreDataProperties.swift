//
//  DreamCollection+CoreDataProperties.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 26/05/22.
//
//

import Foundation
import CoreData


extension DreamCollection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DreamCollection> {
        return NSFetchRequest<DreamCollection>(entityName: "DreamCollection")
    }

    @NSManaged public var title: String?
    @NSManaged public var collects: NSSet?

}

// MARK: Generated accessors for collects
extension DreamCollection {

    @objc(addCollectsObject:)
    @NSManaged public func addToCollects(_ value: DreamElement)

    @objc(removeCollectsObject:)
    @NSManaged public func removeFromCollects(_ value: DreamElement)

    @objc(addCollects:)
    @NSManaged public func addToCollects(_ values: NSSet)

    @objc(removeCollects:)
    @NSManaged public func removeFromCollects(_ values: NSSet)

}

extension DreamCollection : Identifiable {

}
