//
//  DataManager.swift
//  Galaxy
//
//  Created by mr.root on 9/18/22.
//

import Foundation
import UIKit
import CoreData
open class DataManager: NSObject {
    public static  let sharedInstance = DataManager()
    private override init() {}
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveTitleDescription(data: GalaxyLits) {
        let titleGalaxy = GalaxyEntity(context: context)
        titleGalaxy.title = data.title
        titleGalaxy.titledescription = data.planetdescription
        titleGalaxy.image = data.img
        titleGalaxy.date = data.timeDay
        //
        saveContext()
    }
    
    func updatePlanet(data: GalaxyLits , with id: NSManagedObjectID) {
        if let updataPlanets = try? context.existingObject(with: id) as! GalaxyEntity {
            updataPlanets.title = data.title
            updataPlanets.titledescription = data.planetdescription
            updataPlanets.image = data.img
            updataPlanets.date = data.timeDay
        }
        saveContext()
    }
    
    func getNewPlanet() -> [GalaxyLits] {
         var arrListGalaxy: [GalaxyLits] = [GalaxyLits]()
        let galaxyFtech: NSFetchRequest<GalaxyEntity> = GalaxyEntity.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(GalaxyEntity.date), ascending: false)
         galaxyFtech.sortDescriptors = [sort]
        do {
            let result = try context.fetch(galaxyFtech)
            for item in result {
                let newPlanet = GalaxyLits(planetdescription: item.titledescription ?? "" ,
                                           img:item.image,
                                           title: item.title ?? "",
                                           id: item.objectID,
                                           timeDay: item.date )
                arrListGalaxy.append(newPlanet)
                
            }
            return arrListGalaxy
        }
        catch {
            print("Error")
        }
        return []
    }
    func deletePlanet(id: NSManagedObjectID){
        if let object = try? context.existingObject(with: id) {
            context.delete(object)
        }
        saveContext()
    }

    // MARK: - Core Data stac
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "DatabaseService") // Galaxy
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
