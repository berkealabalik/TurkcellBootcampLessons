//
//  File.swift
//  
//
//  Created by Berke Alabalik on 19.03.2022.
//

import Foundation

public enum Decoders {
    static let dataDecoder : JSONDecoder = {
       let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Çalışacak mı acaba
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
