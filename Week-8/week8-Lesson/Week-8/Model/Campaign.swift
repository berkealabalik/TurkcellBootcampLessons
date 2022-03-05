//
//  Campaign.swift
//  Week-8
//
//  Created by Berke Alabalik on 26.02.2022.
//

import Foundation

// MARK: - WelcomeElement

struct Campaign: Codable {
    let id, baslik, icerik, tarih: String
    let resim: String
    let durum: String
}
