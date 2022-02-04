//
//  NotificationExtension.swift
//  table-ViewHW4
//
//  Created by Berke Alabalik on 4.02.2022.
//

import Foundation

extension Notification.Name {
    /*notificationCenter.addObserver(self, selector: #selector(addCity), name: .sendCityData, object: <#T##Any?#>) // dinleyen kısma . */
    
    static let sendCityData = Notification.Name(rawValue: "sendCityData")
}
