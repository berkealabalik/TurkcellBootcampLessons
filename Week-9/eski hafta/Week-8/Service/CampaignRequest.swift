//
//  CampaignRequest.swift
//  Week-8
//
//  Created by Egitim on 26.02.2022.
//

import Foundation




enum CampaignError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct CampaignRequest {
    
    let resourceURL: URL
    
    //SSL Pinning
    // Man in the middle attack
    /***
        SERVER --->    HACKER     ---->  CLIENT
     */
    
    init() {
      
        let resourceString = "http://www.bucayapimarket.com/json.php"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError("Error")
        }
        self.resourceURL = resourceURL
    }
    
    func getCampaign(completion: @escaping(Result<[Campaign], CampaignError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            
            guard let jsonData = data else {
                //MARK: Data verisi alınamamış
                completion(.failure(.noDataAvailable))
               
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let campaigns = try decoder.decode([Campaign].self, from: jsonData)
                //MARK: veri başarıyla alınmıştır
                completion(.success(campaigns))
            } catch {
                //MARK: Json decode error
                completion(.failure(.canNotProcessData))
            }
        }
        
        //MARK: Unutulmamasına dikkat edin
        dataTask.resume()
    }
}
