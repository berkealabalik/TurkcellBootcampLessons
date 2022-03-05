//
//  CampaignRequest.swift
//  Week-8
//
//  Created by Berke Alabalik on 26.02.2022.
//

import Foundation

enum CampaignError : Error {
    case noDataAvailable
    case canNotProcessData
}

struct CampaignRequest {
    let resourceURL : URL
    init() {
        let resourceString = "http://bucayapimarket.com/json.php" // http bir yerden alıyorsak veriyi birşey yapmamız gerek . Info dan izinlerden
        guard let resourceURL = URL(string: resourceString) else { fatalError("URL Erişilemedi")}
        self.resourceURL = resourceURL
    }
    
    
    func getCampaign(completion : @escaping(Result<[Campaign], CampaignError>) -> Void) { // escaping sonra result veri succes mi fail mi onu tutan enum tipi .Result ilki succces durumu , 2. si hata durumu. Hata yoksa campaign arrayi gelcek .
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let jsonData = data else {
                          completion(.failure(.noDataAvailable))
                          return
                      }
                      
                      do {
                          let decoder = JSONDecoder()
                          let campaigns = try decoder.decode([Campaign.self], from: jsonData)
                          completion(.success(campaigns)) // zaten dıştan arrayli içinde varsa campaign gene koy .
                      } catch {
                          completion(.failure(.canNotProcessData))
                          print(error)
                      }
                  }
                  
                  dataTask.resume()
              }
          }
