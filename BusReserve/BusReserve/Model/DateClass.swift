//
//  DateClass.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
//

import Foundation

class Dateclass {
    var day : Int = 1
    var month : Int = 1
    var year : Int = 2021
    
    init(day : Int, month : Int , year : Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    func printDate() {
        print("\(day) / \(month) / \(year)")
    }
}
