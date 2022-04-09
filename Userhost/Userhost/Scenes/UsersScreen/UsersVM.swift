//
//  UsersVM.swift
//  Userhost
//
//  Created by Berke Alabalik on 2.04.2022.
//

import Foundation

protocol UsersViewModelProtocol {
    var delegate : UsersViewModelDelegate? { get set }
    func getUserList()
    var Users : UserList? { get }
}
protocol UsersViewModelDelegate {
    func InformTable()
}
final class UsersViewModel : UsersViewModelProtocol {
    var Users: UserList?
    var delegate: UsersViewModelDelegate?
    var service : UserServiceProtocol = UsersService()
    func getUserList() {
        service.getUserList { response in
            switch response {
            case .success(let result):
                self.Users = result
                self.delegate?.InformTable()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
