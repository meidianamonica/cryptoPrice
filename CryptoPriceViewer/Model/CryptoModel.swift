//
//  CryptoModel.swift
//  CryptoPriceViewer
//
//  Created by Meidiana Monica on 04/06/20.
//  Copyright © 2020 Meidiana Monica. All rights reserved.
//

import Foundation
struct CryptoDataContainer: Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable, Hashable {
    let name: String
    let price: String
}
