//
//  DatabaseConnection.swift
//  MobileChallenge
//
//  Created by Vishal on 6/13/21.
//

import Foundation
import CoreData

class DatabaseConnection {
    
    static let shared = DatabaseConnection()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MobileChallenge")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    
    // MARK: Methods to Open, Store and Fetch data
    func openDatabse(_ entityName: String) throws -> NSEntityDescription {
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: persistentContainer.viewContext) else {
            fatalError("\(entityName) entity is not availabel")
        }
        return entity
     }
    
    
    func requestFetch(_ entityName: String) -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        return request
    }
    
    // MARK: - Core Data Saving support

    func saveContext() throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }else{
            throw CustomError.NoChanges
        }
    }
}
