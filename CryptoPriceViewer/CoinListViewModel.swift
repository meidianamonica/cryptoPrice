//
//  CoinListViewModel.swift
//  CryptoPriceViewer
//
//  Created by Meidiana Monica on 03/06/20.
//  Copyright © 2020 Meidiana Monica. All rights reserved.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    
    private let cryptoService = CryptoService()
    
    @Published var coinViewModels = [CoinViewModel]()
    
    var cancellable: AnyCancellable?
    
    func fetchCoins() {
        print("[CointListViewModel] fetchCoins ...")
        cancellable = cryptoService.fetchCoins().sink(receiveCompletion: { _ in
            
        }, receiveValue: { cryptoContainer in
            print("[CointListViewModel] receiveValue ...")
            self.coinViewModels = cryptoContainer.data.coins.map { CoinViewModel($0) }
            print("[CoinListViewModel] coinViewModels \(self.coinViewModels) ")
        })
    }
    
}





































