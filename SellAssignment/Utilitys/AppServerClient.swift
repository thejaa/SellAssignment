//
//  AppServerClient.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 22/03/21.
//

import Foundation

enum GetUserFailureReason: Int, Error {
    case notFound = 404
}
class AppServerClient {
    static let shared = AppServerClient()
    typealias GetUserResult = Result<[UserModel]?, GetUserFailureReason>
    var userModel = [UserModel]()
    typealias GetUserCompletion = (_ result: GetUserResult) -> Void
    func getWeatherData(url :String,completion: @escaping GetUserCompletion) {
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            
            if let error = responseError {
                print(error)
            } else if let jsonData = responseData {
                do {
                    let model = try JSONDecoder().decode([UserModel].self, from: jsonData)
                    for each in model{
                        self.userModel.append(each)
                    }
                    completion(.success(self.userModel))
                } catch {
                    completion(.failure(GetUserFailureReason.notFound))
                }
            }
        }
        task.resume()
    }
}
