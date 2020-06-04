//
//  ContentView.swift
//  CryptoPriceViewer
//
//  Created by Meidiana Monica on 03/06/20.
//  Copyright © 2020 Meidiana Monica. All rights reserved.
//

import SwiftUI

struct CoinList: View {
    @ObservedObject private var viewModel = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.coinViewModels, id: \.self) { coinViewModel in
                Text(coinViewModel.displayText)
            }.onAppear{
                self.viewModel.fetchCoins()
            }.navigationBarTitle("Coins")
        }
    }
}

struct CoinList_Previews: PreviewProvider {
    static var previews: some View {
        CoinList()
    }
}
