//
//  DatabaseService.swift
//  MobileChallenge
//
//  Created by Vishal on 6/13/21.
//

import Foundation
import CoreData

protocol FavoriteServiceProtocol: AnyObject {
    func create(AndSave entity: String, data: Artists.Node) throws -> Void
    func getAll(DataFrom entity: String) throws -> [Artists.Node]
    func getOne(entity: String, id: String) throws -> Artists.Node?
    func delete(entity: String, id: String) throws -> Void
}

class FavoriteService: FavoriteServiceProtocol {
    
    static let shared = FavoriteService()
    let dbconnection: DatabaseConnection
    
    private init(){
        dbconnection = DatabaseConnection.shared
    }
    
    var context: NSManagedObjectContext {
        dbconnection.persistentContainer.viewContext
    }
    
    func create(AndSave entity: String, data: Artists.Node) throws -> Void  {
        
        guard try getOne(entity: entity, id: data.id ?? "") == nil else {
            throw CustomError.duplicateFavorite
        }
        
        let entity = try dbconnection.openDatabse(entity)
        let entityObject = NSManagedObject(entity: entity, insertInto: context)
        entityObject.setValue(data.id, forKey: "id")
        entityObject.setValue(data.encode(), forKey: "artist")
        try dbconnection.saveContext()
    }

    func getAll(DataFrom entity: String) throws -> [Artists.Node] {
        var artistLocal = [Artists.Node]()
        let request = dbconnection.requestFetch(entity)
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
        let request = dbconnection.requestFetch(entity)
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
    
    func delete(entity: String, id: String) throws -> Void {
        let request = dbconnection.requestFetch(entity)
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %@", id)
        let results = try context.fetch(request)
        for result in results as! [NSManagedObject] {
            context.delete(result)
            break
        }
    }
}


extension Artists.Node {
    func encode() -> String {
        let encoder = JSONEncoder()
        do {
            let obj = try encoder.encode(self)
            return String(data: obj, encoding: .utf8) ?? ""
        }catch let error {
            print(error)
            return ""
        }
    }
}

extension String {
    var toData: Data? {
        self.data(using: .utf8)
    }
}
