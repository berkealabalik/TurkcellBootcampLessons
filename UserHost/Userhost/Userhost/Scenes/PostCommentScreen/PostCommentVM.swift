//
//  PostCommentVC.swift
//  Userhost
//
//  Created by Berke Alabalik on 5.04.2022.
//

import Foundation
protocol PostCommentModelProtocol {
    var delegate : PostCommentDelegate? { get set}
    func getComments()
    var FilteredComments : CommentList? { get }
    func filterComments()
}
protocol PostCommentDelegate {
    func reloadTable()
}
final class PostCommentModel : PostCommentModelProtocol{
    private var Comments: CommentList?
    var FilteredComments : CommentList? = []
    var delegate: PostCommentDelegate?
    var SelectedPost : PostListElement?
    private var service : CommentServiceProtocol = CommentService()
    
    init(post : PostListElement , user : UserListElement) {
        self.SelectedPost = post
        self.getComments()
    }
    
    func getComments() {
        service.getCommentList { response in
            switch response {
            case .success(let result):
                self.Comments = result
                self.filterComments()
                self.delegate?.reloadTable()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    func filterComments() {
        Comments?.forEach({ x in
            if x.postID == self.SelectedPost?.id {
                self.FilteredComments?.append(x)
            }
        })
    }
}
