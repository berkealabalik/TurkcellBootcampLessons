//
//  CodeSendRequestModel.swift
//  ReservationApp
//
//  Created by Berke Alabalik on 5.03.2022.
//

import Foundation

struct CodeSendRequestModel: Decodable {
    let reservationNumber: String?
    let phoneNumber: String?
}
