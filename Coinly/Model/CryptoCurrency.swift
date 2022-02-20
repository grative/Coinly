import Foundation

//MARK: - Basic Model for Crypto API

struct CryptoCurrency: Decodable {
    let name: String
    let currency: String
    let price: String
    let logo_url: String
}
