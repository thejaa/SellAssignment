//
//  UserManager.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//

import Foundation

struct UserManager{
    
    private let _userDataRepository = UserDataRepository()
    
    func addToFavorites(user : User) -> Bool{
        _userDataRepository.addToFav(user: user)
        return true
    }
    
    func fetchFavorites(){
        if let users = _userDataRepository.fetchFavorites(){
            print(users)
        }
    }
    
    func getUser(user : User?) -> Bool{
        return _userDataRepository.fetchUserby(email: user?.emailID ?? "") ? true : false
    }
    
    func deleteUser(user:User) -> Bool{
        return _userDataRepository.removeCityFromFavorites(user: user) ? true : false
    }
    
}
