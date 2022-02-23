//
//  Passenger.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
//

import Foundation

class Passengerclass {
    var name : String = "İsimsiz"
    var Surname : String = "İsimsiz"
    var id : Int = 0
    var email : String = "null@gmail"
    var tel : String = "0"
    
    init(name : String,Surname : String , id : Int,email : String , tel : String){
        self.name = name
        self.Surname = Surname
        self.id = id
        self.email = email
        self.tel = tel
    }
    func yolcuYazdır() {
       print("\(name)-\(Surname)-\(id)")
    }
    
    
}
