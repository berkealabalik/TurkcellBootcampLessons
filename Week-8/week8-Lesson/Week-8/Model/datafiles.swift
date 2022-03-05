//
//  datafiles.swift
//  Week-8
//
//  Created by Berke Alabalik on 4.03.2022.
//

import Foundation

struct File {
    var status: Bool?
    var statusCode: Int?
    var data: [Data]
    var info: [Info]
}
struct Data{
    var id: Int
    var name: String
}
struct Info {
    var error: [Error]
    var friendlyMessage: String
}
struct Error{
    var error: String
}

