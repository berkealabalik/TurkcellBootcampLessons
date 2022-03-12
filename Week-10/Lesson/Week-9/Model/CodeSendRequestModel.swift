//
//  CodeSendRequestModel.swift
//  Week-9
//
//  Created by Egitim on 5.03.2022.
//

import Foundation

struct CodeSendRequestModel: Decodable {
    let reservationNumber: String?
    let phoneNumber: String?
}
