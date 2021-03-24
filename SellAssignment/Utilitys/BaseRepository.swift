//
//  BaseRepository.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//

import Foundation

protocol BaseRepository {
    associatedtype T
    func addToFav(user : T)
    func fetchFavorites() -> [T]?
    func removeCityFromFavorites(user:T) -> Bool
}
