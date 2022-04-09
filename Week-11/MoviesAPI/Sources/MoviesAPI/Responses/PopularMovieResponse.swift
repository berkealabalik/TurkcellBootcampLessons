//
//  File.swift
//  
//
//  Created by Berke Alabalik on 19.03.2022.
//

import Foundation

public struct PopularMovieResponse : Decodable {
    public let results: [Movie]
    private enum RootCodingKeys : String , CodingKey {
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([Movie].self, forKey: .results)
    }
}

/*public struct PopularMoviesResponse : Decodable {
    public results : [Movie]
    
    //decodeIfPresent(<#T##UInt32#>) NEDİR NE ZAMAN KULLANILIR .
}
*/
