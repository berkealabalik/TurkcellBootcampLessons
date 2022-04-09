//
//  PostDetailScreenVM.swift
//  Userhost
//
//  Created by Berke Alabalik on 4.04.2022.
//

import Foundation
protocol PostDetailScreenModelProtocol {
    var PostSelectedVC : PostListElement? { get }
    var UserSelectedVC : UserListElement? { get }
}
final  class PostDetailScreenModel : PostDetailScreenModelProtocol{
    var PostSelectedVC: PostListElement?
    var UserSelectedVC: UserListElement?
    init (post : PostListElement , user : UserListElement) {
        self.PostSelectedVC = post
        self.UserSelectedVC = user
    }
}
