//
//  CommentList.swift
//  Userhost
//
//  Created by Berke Alabalik on 5.04.2022.
//

import Foundation
struct CommentListElement: Decodable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
typealias CommentList = [CommentListElement]
