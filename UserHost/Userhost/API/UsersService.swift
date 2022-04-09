//
//  UsersService.swift
//  Userhost
//
//  Created by Berke Alabalik on 2.04.2022.
//

import Foundation
import Alamofire

protocol UserServiceProtocol {
    func getUserList(completion : @escaping(Result<UserList,Error>)-> Void)
}
class UsersService : UserServiceProtocol {
    func getUserList(completion: @escaping (Result<UserList, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let usersList = try decoder.decode(UserList.self, from: data)
                    completion(.success(usersList))
                } catch {
                    print("****JSON DECODE ERROR****")
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
