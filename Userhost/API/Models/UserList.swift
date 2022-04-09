//
//  UserList.swift
//  Userhost
//
//  Created by Berke Alabalik on 2.04.2022.

import Foundation

// MARK: - WelcomeElement
struct UserListElement: Decodable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// MARK: - Address
struct Address: Decodable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Decodable{
    let lat, lng: String?
}

// MARK: - Company
struct Company: Decodable {
    let name, catchPhrase, bs: String?
}

typealias UserList = [UserListElement]
