//
//  GalaxyEntity+CoreDataProperties.swift
//  Galaxy
//
//  Created by mr.root on 9/19/22.
//
//

import Foundation
import CoreData


extension GalaxyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GalaxyEntity> {
        return NSFetchRequest<GalaxyEntity>(entityName: "GalaxyEntity")
    }

    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var titledescription: String?

}

extension GalaxyEntity : Identifiable {

}
