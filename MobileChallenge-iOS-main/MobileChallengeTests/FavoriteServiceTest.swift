//
//  FavouriteServiceTest.swift
//  MobileChallengeTests
//
//  Created by Vishal on 6/14/21.
//

import Foundation
@testable import MobileChallenge
import CoreData

class FavoriteServiceTest: DatabaseConnection, FavoriteServiceProtocol{
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func create(AndSave entity: String, data: Artists.Node) throws {
        guard try getOne(entity: entity, id: data.id ?? "") == nil else {
            throw CustomError.duplicateFavorite
        }
        
        let entity = try openDatabse(entity)
        let entityObject = NSManagedObject(entity: entity, insertInto: context)
        entityObject.setValue(data.id, forKey: "id")
        entityObject.setValue(data.encode(), forKey: "artist")
        try saveContext()
    }
    
    func getAll(DataFrom entity: String) throws -> [Artists.Node] {
        var artistLocal = [Artists.Node]()
        let request = requestFetch(entity)
        let results = try context.fetch(request)
        for result in results as! [NSManagedObject] {
            guard let artist = result.value(forKey: "artist") as? String, let data = artist.toData else {
                throw CustomError.NullData
            }
            if let genericData = data.decode(type: Artists.Node.self) {
                artistLocal.append(genericData)
            }
        }
        return artistLocal
    }
    
    func getOne(entity: String, id: String) throws -> Artists.Node? {
        let request = requestFetch(entity)
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %@", id)
        let results = try context.fetch(request)
        for result in results as! [NSManagedObject] {
            let artist = result.value(forKey: "artist") as! String
            let genericData = artist.toData?.decode(type: Artists.Node.self)
            return genericData ?? nil
        }
        return nil
    }
    
    func delete(entity: String, id: String) throws {
        let request = requestFetch(entity)
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %@", id)
        let results = try context.fetch(request)
        for result in results as! [NSManagedObject] {
            context.delete(result)
            break
        }
    }
}
