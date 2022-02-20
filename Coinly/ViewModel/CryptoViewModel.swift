import Foundation

//MARK: - Crypto View Models

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
    
    var name: String {
        return self.cryptoCurrency.name
    }
    
    var currency: String {
        return self.cryptoCurrency.currency
    }
    
    var price: String {
        return self.cryptoCurrency.price
    }
}
