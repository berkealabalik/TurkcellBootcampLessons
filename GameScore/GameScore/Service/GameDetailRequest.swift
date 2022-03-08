//
//  GameDetailRequest.swift
//  GameScore
//
//  Created by Berke Alabalik on 7.03.2022.
//

import Foundation


struct GameDetailRequest {
    
    let resourceURL: NSURLRequest
       init() {
        
         let urlink = "https://api.rawg.io/api/games/" + slugName + "?key=87fa30b6d7864a3a9881e1ba9d514fce"
         let request = NSMutableURLRequest(url: NSURL(string: urlink)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
               
           request.httpMethod = "GET"
           request.allHTTPHeaderFields = headers
           self.resourceURL = request
       }
    
   
    
    
       
       func getGameDetail(completion: @escaping(Result<GamesDetailStructs, GamesError>) -> Void) {
          
           let dataTask = URLSession.shared.dataTask(with: resourceURL as URLRequest) { data, response, error in
              
               guard let jsonData = data else {
                   completion(.failure(.noDataAvailable))
                   return
               }
               print(jsonData)
               do {
                   let decoder = JSONDecoder()
                
                   let gamesData = try decoder.decode(GamesDetailStructs.self, from: jsonData)
                  
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
