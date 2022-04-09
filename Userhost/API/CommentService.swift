//
//  CommentService.swift
//  Userhost
//
//  Created by Berke Alabalik on 5.04.2022.
//

import Foundation
import Alamofire

protocol CommentServiceProtocol {
    func getCommentList(completion : @escaping(Result<CommentList,Error>)-> Void)
}
class CommentService : CommentServiceProtocol {
    func getCommentList(completion: @escaping (Result<CommentList, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let commentList = try decoder.decode(CommentList.self, from: data)
                    completion(.success(commentList))
                } catch {
                    print("****JSON DECODE ERROR****")
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
