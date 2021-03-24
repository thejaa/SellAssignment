//
//  UserDetailVM.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//

import Foundation

class UserDetailVM{
    
    private let userManager = UserManager()
    
    func addToFavorites(user:User) -> Bool{
        return userManager.addToFavorites(user: user)
    }
    
    func isUseraddedAsFavorite(user:User) -> Bool{
        return userManager.getUser(user: user) ? true : false
    }
    
    func deleteFavorite(user : User) -> Bool{
        return userManager.deleteUser(user: user)
    }
    
    
}
