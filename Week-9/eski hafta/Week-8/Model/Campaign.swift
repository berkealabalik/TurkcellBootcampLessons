//
//  Campaign.swift
//  Week-8
//
//  Created by Egitim on 26.02.2022.
//

import Foundation

struct Campaign: Codable {
    let id, baslik, icerik, tarih: String
    let resim: String
    let durum: String
}
