//
//  Section.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import Foundation
// hash bir datayı uzunluğu ne olursa olsun özetini çıkarıyor .sabit uzunlukta veriye çeviriyor . Ali -> DAASDDXD , ali -> QSRDSFTSF ne olursa olsun farklı çeviriyor.Tersi anlamaz .MD5 Güvenilir değil .
struct Section : Decodable ,Hashable{
    
    let id : Int
    let type : String
    let title : String
    let subtitle : String
    let items : [EDevlet]
    
}
