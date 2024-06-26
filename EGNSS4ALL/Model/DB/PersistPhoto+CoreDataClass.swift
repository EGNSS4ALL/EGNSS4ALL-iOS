//
//  PersistPhoto+CoreDataClass.swift
//  GTPhotos
//
//
//

import Foundation
import CoreData

@objc(PersistPhoto)
public class PersistPhoto: NSManagedObject {
    
    static func selectByActualUser(manageObjectContext: NSManagedObjectContext) -> [PersistPhoto]? {
        var persistPhotos: [PersistPhoto]? = nil
        let persistPhotoRequest: NSFetchRequest<PersistPhoto> = PersistPhoto.fetchRequest()
        persistPhotoRequest.predicate = NSPredicate(format: "userid == %@", String(UserStorage.userID))
        do {
            persistPhotos = try manageObjectContext.fetch(persistPhotoRequest)
        }
        catch {
            print("Could not load save data: \(error.localizedDescription)")
        }
        return persistPhotos
    }

}


