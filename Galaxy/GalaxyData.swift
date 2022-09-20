//
//  GalaxyData.swift
//  Galaxy
//
//  Created by mr.root on 9/15/22.
//

import Foundation
import CoreData
import UIKit

struct Note {
    var planetdescription: String
    var img: UIImage?
    var title: String
    var id: NSManagedObjectID? = nil
    var timeDay: Date
}
