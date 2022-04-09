

import Foundation

public struct CoinsData : Decodable {
    public let data : DataClass?
}


public struct DataClass : Decodable {
   public let coins : [Coin]?
}

public struct Coin: Decodable {
    public  let uuid, symbol, name: String?
    public  let color: String?
    public let iconURL: String?
    public let marketCap, price: String?
    public let listedAt, tier: Int?
    public let change: String?
    public let rank: Int?
    public let sparkline: [String]?
    public let lowVolume: Bool?
    public let coinrankingURL: String?
    public let the24HVolume, btcPrice: String?

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color
        case iconURL = "iconUrl"
        case marketCap, price, listedAt, tier, change, rank, sparkline, lowVolume
        case coinrankingURL = "coinrankingUrl"
        case the24HVolume = "24hVolume"
        case btcPrice
    }
}


