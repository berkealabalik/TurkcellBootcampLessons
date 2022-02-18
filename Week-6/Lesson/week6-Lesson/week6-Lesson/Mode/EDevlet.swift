//
//  EDevlet.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import Foundation // bu model json file parse edicek .

struct EDevlet : Decodable ,Hashable{
    let id : Int
    let name : String
    let subheading : String
    let image : String
     
}
