//
//  CoinDataService.swift
//  CryptoCurrencies
//
//  Created by Zoltán Hidegkuti on 2022. 05. 11..
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allcoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allcoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}