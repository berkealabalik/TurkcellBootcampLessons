//
//  PostScreenVM.swift
//  Userhost
//
//  Created by Berke Alabalik on 3.04.2022.
//

import Foundation
protocol PostScreenModelProtocol {
    var delegate : PostScreenDelegate?{ get set }
    func getPosts()
    func filterPost()
    var filteredPosts : PostList? { get }
    var selectedUserVC : UserListElement? { get }
}
protocol PostScreenDelegate {
    func InformTable()
}
final class PostScreenModel : PostScreenModelProtocol{
    var selectedUserVC: UserListElement?
    var filteredPosts: PostList? = []
    var delegate: PostScreenDelegate?
    var service : PostServiceProtocol = PostService()
    var Posts : PostList?
    
    init(user : UserListElement) {
        self.selectedUserVC = user
        getPosts()
    }
    func getPosts() {
        service.getPostList { response in
            switch response {
            case .success(let result):
                self.Posts = result
                self.filterPost()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    func filterPost() {
        Posts?.forEach({ x in
            if x.userID! == selectedUserVC?.id {
                self.filteredPosts?.append(x)
            }
        })
        self.delegate?.InformTable()
    }
}
