//
//  UserDetailVM.swift
//  Userhost
//
//  Created by Berke Alabalik on 6.04.2022.
//

import Foundation
protocol UserInformationModelProtocol {
    var user: UserListElement? { get }
}
final class UserInformationModel : UserInformationModelProtocol {
    var user : UserListElement?
    init(usr : UserListElement) {
        self.user = usr
    }
}
