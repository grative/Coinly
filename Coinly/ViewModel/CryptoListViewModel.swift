import Foundation

//MARK: - Crypto List View Models

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        
    let crypto = self.cryptoCurrencyList[index]
    return CryptoViewModel(cryptoCurrency: crypto)
    }
}
