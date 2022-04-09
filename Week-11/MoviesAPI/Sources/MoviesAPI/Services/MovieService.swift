//
//  File.swift
//  
//
//  Created by Berke Alabalik on 19.03.2022.
//

import Foundation
import Alamofire

public protocol MovieServiceProtocol { // movie başında I varsa Interface
    func fetchPopularMovies(completion : @escaping (Result<[Movie],Error>) -> Void )
    
    
}

public class PopularMoviesService :MovieServiceProtocol {
    public init() {}
    public func fetchPopularMovies(completion: @escaping (Result<[Movie],Error>) -> Void ) {
        let urlString = "https://api.themoviedb.org/3/movie/popular?language=en-US&api_key=c8b47970134cde359623ad18862473bd&page=1"
        AF.request(urlString).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dataDecoder
                do {
                    let response = try decoder.decode(PopularMovieResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    print("****JSON DECODE ERROR ******")
                }
                
            case .failure(let error):
                print("***GEÇİCİ BİR SORUN***")
            }
        }
    }
    
}
