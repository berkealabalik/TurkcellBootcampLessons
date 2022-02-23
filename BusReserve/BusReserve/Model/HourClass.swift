//
//  HourClass.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
//

import Foundation

class Hourclass {
    var hour : Int = 0
    var minute : Int = 0
    
    init(hour : Int,minute : Int) {
        self.hour = hour
        self.minute = minute
    }
    func printHour() {
        print("\(hour):\(minute)")
    }
    
}
