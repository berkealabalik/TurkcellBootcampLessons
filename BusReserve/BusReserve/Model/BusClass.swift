//
//  BusClass.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
//

import Foundation
import UIKit

class BusClass {
   

    var busid : Int
    var businessName : String
    var neredenBus : String
    var nereyeBus : String
    var saat : Hourclass
    var busDate : Dateclass
    var fiyat : Int
    var koltukdüzeni : [Int: Bool] = [1: false,2:false,3: false,4:false,5: false,6:false,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:true,15: false,16:true,17: false,18:true,19: false,20:true,21: false,22:true,23: false,24:true,25: false,26:true,27: false,28:true,29: false,30:true,31: false,32:true,33: false,34:true,35:false,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false]
    var companyImage : String
    
    init(busid : Int,businessName : String, neredenBus : String , nereyeBus : String , saat : Hourclass, busDate : Dateclass, koltukdüzeni : [Int:Bool], companyImage : String , fiyat : Int ) {
        self.busid = busid
        self.businessName = businessName
        self.neredenBus = neredenBus
        self.nereyeBus = nereyeBus
        self.saat = saat
        self.busDate = busDate
        self.koltukdüzeni = koltukdüzeni
        self.companyImage = companyImage
        self.fiyat = fiyat
    }
    
    
    func buyPlace(places : [String]) {
        for x in places {
            koltukdüzeni[Int(x)!] = true
            
        }
        
    }
    
   
    
}
