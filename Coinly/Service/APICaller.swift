import Foundation

//MARK: - Basic APICaller to Get Crypto Datas

class APICaller {
    
    func getCryptoCurrency(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                
            } else
            
            if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                
                }
            }
        }
        task.resume()
    }
}
