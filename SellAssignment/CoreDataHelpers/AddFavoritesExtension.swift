//
//  AddFavoritesExtension.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//

import Foundation

extension AddFavorites{
    func convertToUser() -> User{
        return User(emailID: self.emailid ?? "")
    }
}
