//
//  CoinViewModel.swift
//  CryptoPriceViewer
//
//  Created by Meidiana Monica on 04/06/20.
//  Copyright © 2020 Meidiana Monica. All rights reserved.
//

import Foundation
struct CoinViewModel: Hashable {
    private let coin: Coin
    
    var name: String {
        return coin.name
    }
    
    var formattedPrice: String{
        // do some formatting
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        guard let price = Double(coin.price), let formattedPrice = numberFormatter.string(from: NSNumber(value:price)) else { return "" }
        return formattedPrice
    }
    
    var displayText: String {
        return name + " - " + formattedPrice
    }
    
    init(_ coin: Coin) {
        self.coin = coin
    }
    
}
