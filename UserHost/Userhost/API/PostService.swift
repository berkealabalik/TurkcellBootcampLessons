//
//  PostService.swift
//  Userhost
//
//  Created by Berke Alabalik on 3.04.2022.
//

import Foundation
import Alamofire

protocol PostServiceProtocol {
    func getPostList(completion : @escaping(Result<PostList,Error>)-> Void)
}
class PostService : PostServiceProtocol {
    func getPostList(completion: @escaping (Result<PostList, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let usersList = try decoder.decode(PostList.self, from: data)
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
