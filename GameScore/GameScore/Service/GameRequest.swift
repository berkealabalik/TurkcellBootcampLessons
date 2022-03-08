//
//  GameRequest.swift
//  GameScore
//
//  Created by Berke Alabalik on 5.03.2022.
//

import Foundation


let headers = [
    "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com",
    "x-rapidapi-key": "65b8e30741msh391b61ed2366aadp179b82jsn6b967418e390"
]

enum GamesError : Error {
    case noDataAvailable
    case canNotProcessData
}


struct GameRequest {
    
    let resourceURL: NSURLRequest


       init() {
         let request = NSMutableURLRequest(url: NSURL(string: "https://api.rawg.io/api/games?key=87fa30b6d7864a3a9881e1ba9d514fce")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
               
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headers
           self.resourceURL = request
       }
       
       func getCampaign(completion: @escaping(Result<[GamesInfo], GamesError>) -> Void) {
          
           let dataTask = URLSession.shared.dataTask(with: resourceURL as URLRequest) { data, response, error in
              
               guard let jsonData = data else {
                   completion(.failure(.noDataAvailable))
                   return
               }
               do {
                   let decoder = JSONDecoder()
                   let gamesData = try decoder.decode(GamesInfo.self, from: jsonData)
                   //MARK: veri başarıyla alınmıştır
                   completion(.success([gamesData]))
               } catch {
                   //MARK: Json decode error
                   completion(.failure(.canNotProcessData))
               }
           }
           
           //MARK: Unutulmamasına dikkat edin
           dataTask.resume()
       }
   }


