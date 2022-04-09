//
//  PostList.swift
//  Userhost
//
//  Created by Berke Alabalik on 3.04.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postList = try? newJSONDecoder().decode(PostList.self, from: jsonData)

import Foundation

// MARK: - PostListElement
struct PostListElement: Decodable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
typealias PostList = [PostListElement]
