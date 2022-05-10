//
//  Dream+CoreDataProperties.swift
//  TrangueellApp
//
//  Created by Alessandra De Matteo on 10/05/22.
//
//

import Foundation
import CoreData


extension Dream {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dream> {
        return NSFetchRequest<Dream>(entityName: "Dream")
    }

    @NSManaged public var dreamDescription: String?
    @NSManaged public var dreamDate: Date?
    @NSManaged public var dreamTitle: String?

}

extension Dream : Identifiable {

}
