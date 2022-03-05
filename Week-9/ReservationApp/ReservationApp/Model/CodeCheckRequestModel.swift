//
//  CodeCheckRequestModel.swift
//  ReservationApp
//
//  Created by Berke Alabalik on 5.03.2022.
//

import Foundation

struct CodeCheckRequestModel: Decodable {
    let reservationNumber: String?
    let confirmationCode: String?
}
