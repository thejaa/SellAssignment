//
//  UserDataRepository.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//

import Foundation
import CoreData

protocol UserRepository : BaseRepository{}

class UserDataRepository : UserRepository {
    
    func addToFav(user: User) {
        let userObject = AddFavorites(context: PersistanceStorage.shared.context)
        userObject.emailid = user.emailID
        PersistanceStorage.shared.saveContext()
    }
    
    func fetchFavorites() -> [User]? {
        let result = PersistanceStorage.shared.fetchManagedObject(managedObject: AddFavorites.self)
        var users : [User] = []
        guard result != nil && result?.count != 0 else { return nil}
        result!.forEach( { eachUser in
            users.append(eachUser.convertToUser())
        })
        return users
    }
    
    func fetchUserby(email : String) -> Bool{
        let result = fetchUser(emailID: email)
        guard result != nil else {return false}
        return true
    }
    func removeCityFromFavorites(user: User) -> Bool {
        let result = fetchUser(emailID: user.emailID)
        guard result != nil else { return false }
        PersistanceStorage.shared.context.delete(result!)
        PersistanceStorage.shared.saveContext()
        return true
    }
    
    private func fetchUser(emailID : String) -> AddFavorites?{
        let fetchRequest = NSFetchRequest<AddFavorites>(entityName: "AddFavorites")
        let fetchByName = NSPredicate(format: "emailid==%@",emailID)
        fetchRequest.predicate = fetchByName
        do {
            let result = try PersistanceStorage.shared.context.fetch(fetchRequest)
            guard result.count != 0 else { return nil}
            return result.first
        }catch let error{
            debugPrint(error.localizedDescription)
        }
        return nil
    }
    
    typealias T = User
    
}
