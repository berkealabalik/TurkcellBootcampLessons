//
//  File.swift
//  
//
//  Created by Berke Alabalik on 20.03.2022.
//

import Foundation
public enum Decoders {
    static let dataDecoder : JSONDecoder = {
       let decoder = JSONDecoder()
        return decoder
    }()
}
