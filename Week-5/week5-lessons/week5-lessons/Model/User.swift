//
//  User.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 4.02.2022.
//

import Foundation

struct User : Decodable{ // Codable protocol bize sadece veri çekceğimiz için decodable yeterli.
    let username : String? // json neyse öyle yaz birerbir.Alacagın yerdeki datadaki isimle. 
    let email : String?
    let company : Company? // company obje içindekilere erişmek için
}

struct Company : Decodable {
    let name : String?
    
}
