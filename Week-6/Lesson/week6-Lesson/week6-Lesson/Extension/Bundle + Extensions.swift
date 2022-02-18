//
//  Bundle + Extensions.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import Foundation

extension Bundle { // Json Parçalayacak Metod
    func decode<T: Decodable>(_ type : T.Type, from file: String)-> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed To Locate \(file) in bundle")
        } // resource yollanan dosya ismi , extension dosya türü json , txt olabilir
                
        guard let data = try? Data(contentsOf: url) else { // data veri tutulup tutulamadımı
            fatalError("Failed To Load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        guard let contents = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed To Decode \(file) from bundle")
        }
        
        return contents
                
    }
}
