//
//  TicketClass.swift
//  BusReserve
//
//  Created by Berke Alabalik on 13.02.2022.
//

import Foundation
import UIKit

class Ticket {
    let Yolcu : Passengerclass
    let Tarih : Dateclass
    let Saat : Hourclass
    var Koltuk : [String] = []
    var AlinanKoltukSayisi : Int
    
    init(Yolcu : Passengerclass , Tarih : Dateclass , Saat : Hourclass ,Koltuk : [String], AlinanKoltukSayisi : Int) {
        self.Yolcu = Yolcu
        self.Tarih = Tarih
        self.Saat = Saat
        self.Koltuk = Koltuk
        self.AlinanKoltukSayisi = AlinanKoltukSayisi
    }
    
    
    func compare(x : [String]){
      
    }
    func addChair(){
        
    }
    
    func reserve(){
        
    }
    func print() {
        
    }
    
    
}
    
    
     
    

