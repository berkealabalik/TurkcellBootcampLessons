//
//  Router.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let apiKey = "c8b47970134cde359623ad18862473bd"
    case nowPlaying
    case UpcomingList
    case MovieDetail(movieId : String?)
    case SimilarMovies(movieId : String?)
    case searchMovie(searchWord : String?)
    var baseURL : URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .UpcomingList , .nowPlaying , .MovieDetail, .SimilarMovies , .searchMovie:
            return .get
        }
    }
    var parameters: [String: Any]? {
        get {
        var params: Parameters = [:]
        switch self {
        case .nowPlaying:
            return nil
        case .UpcomingList:
            return nil
        case .MovieDetail(movieId : let movieId):
            if let movieId = movieId {
                params[""] = movieId
            }
        case .SimilarMovies(movieId: let movieId):
            if let movieId = movieId {
                params[""] = movieId
            }
        case .searchMovie(searchWord: let word):
            if let word = word {
                params["query"] = word
            }
             
        }
        return params
        }
        set {
            
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        case .UpcomingList:
            return "/movie/upcoming"
        case .MovieDetail:
            return "movie/" + ((parameters![""] as! String) )
        case .SimilarMovies(movieId: _):
            return "movie/" + ((parameters![""] as! String) ) + "/similar"
        case .searchMovie:
            return "search/movie"
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
       
        var completeParameters = parameters ?? [:]
        completeParameters.removeValue(forKey: "")
        completeParameters["api_key"] = Router.apiKey
        let urlRequestPrint = try encoding.encode(urlRequest, with: completeParameters)
        debugPrint("************> MY URL: ", urlRequestPrint.url ?? "")
        
        return try encoding.encode(urlRequest, with: completeParameters)
    }
    
}
