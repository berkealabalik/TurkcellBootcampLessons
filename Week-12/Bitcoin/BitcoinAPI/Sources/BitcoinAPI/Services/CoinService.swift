//
//  File.swift
//  
//
//  Created by Berke Alabalik on 19.03.2022.
//

import Foundation
import Alamofire

public protocol BitcoinServiceProtocol {
    func fetchCoins(completion : @escaping (Result<[Coin],Error>) -> Void)
}

public class BitcoinService :BitcoinServiceProtocol {
    public init() {}
    public func fetchCoins(completion : @escaping (Result<[Coin],Error>) -> Void) {
        let urlString = "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins"
        AF.request(urlString).responseData {  [weak self] response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.dataDecoder
                do {
                    let response = try decoder.decode(CoinsData.self, from: data)
                    completion(.success((response.data?.coins)!))
                } catch {
                    print("****JSON DECODE ERROR ******")
                }
                
            case .failure(let error):
                print("***GEÇİCİ BİR SORUN***")
            }
        }
    }
}
