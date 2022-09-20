//
//  GalaxyEntity+CoreDataProperties.swift
//  Galaxy
//
//  Created by admin on 20/09/2022.
//
//

import Foundation
import CoreData


extension GalaxyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GalaxyEntity> {
        return NSFetchRequest<GalaxyEntity>(entityName: "GalaxyEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var titledescription: String?

}

extension GalaxyEntity : Identifiable {

}
