//
//  UserViewModel.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 22/03/21.
//

import Foundation

class HomeViewModel {
    
    typealias userModelCompletion = (_ result: [UserModel]?) -> Void
    
    func getUserData(completion: @escaping userModelCompletion){
        AppServerClient.shared.getWeatherData {  [weak self] response in
            switch response{
            case .success(let _userData):
                completion(_userData)
            case .failure(let _error):
                print(_error.localizedDescription)
            }
        }
    }
    
    
    
    
}
