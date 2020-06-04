//
//  CryptoService.swift
//  CryptoPriceViewer
//
//  Created by Meidiana Monica on 03/06/20.
//  Copyright © 2020 Meidiana Monica. All rights reserved.
//

import Foundation
import Combine

final class CryptoService {
    
    var components: URLComponents {
        var components  = URLComponents()
        components.scheme = "https"
        components.host = "api.coinranking.com"
        components.path = "/v1/public/coins"
        components.queryItems = [
            URLQueryItem(name: "base", value: "USD"),
            URLQueryItem(name: "timePeriod" , value: "24h")
        ]
        return components
    }
    
    func fetchCoins() -> AnyPublisher<CryptoDataContainer, Error> {
//        let urlString = "https://api.coinranking.com/v1/public/coins?base=USD&timePeriod=24h"
//        let url = URL(string:urlString)
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map{ $0.data }
            .decode(type:CryptoDataContainer.self , decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}

