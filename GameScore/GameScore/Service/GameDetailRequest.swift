//
//  GameDetailRequest.swift
//  GameScore
//
//  Created by Berke Alabalik on 7.03.2022.
//

import Foundation
let headersDetail = [
    "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com",
    "x-rapidapi-key": "65b8e30741msh391b61ed2366aadp179b82jsn6b967418e390"
]

struct GameDetailRequest {
    let resourceURL: NSURLRequest
    init(slugname : String) {
        let urlink = "https://rawg-video-games-database.p.rapidapi.com/games/" + slugname + "?key=87fa30b6d7864a3a9881e1ba9d514fce"
      
         let request = NSMutableURLRequest(url: NSURL(string: urlink)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
               
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headersDetail
           self.resourceURL = request
        
       }
    
   
    
    
       
    func getGameDetail(completion: @escaping(Result<GamesDetailStruct, GamesError>) -> Void) {
           let dataTask = URLSession.shared.dataTask(with: resourceURL as URLRequest) { data, response, error in
               guard let jsonData = data else {
                   completion(.failure(.noDataAvailable))
                   return
               }
               
               do {
                   
                   /*
                   //SERİALİZATİON
                   let gamesData = try JSONSerialization.jsonObject(with: jsonData, options: [])
                   let jsonDataR = try JSONSerialization.data(withJSONObject: gamesData, options: [])
                   print("JSON data: \(jsonDataR)")
                   let jsonString = String(data: jsonDataR, encoding: .utf8)!
                   print("JSON string: \(jsonString)")
                    */
                   
                   
                    //DECODER
                   let decoder = JSONDecoder()
                   let gamesData = try decoder.decode(GamesDetailStruct.self, from: jsonData)
                   //MARK: veri başarıyla alınmıştır
                    
                   completion(.success(gamesData))
               } catch {
                   //MARK: Json decode error
                   completion(.failure(.canNotProcessData))
               }
           }
           
           //MARK: Unutulmamasına dikkat edin
           dataTask.resume()
       }
   }
