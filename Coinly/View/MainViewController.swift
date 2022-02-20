import UIKit

class MainViewController: UIViewController {
    
//MARK: - Basic Components of MainViewController
    
    //MARK: Components
    
    private let cryptoTable: UITableView = {
        let table = UITableView()
        table.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return table
    }()
    
    //MARK: Variables
    
    private var cryptoListViewModel : CryptoListViewModel!

//MARK: - View Life Cycle (viewDidLoad)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDatas()
        tableConfigurations()
        
    }

//MARK: - View Life Cycle (viewDidLayoutSubviews)

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cryptoTable.frame = view.bounds
        
    }

//MARK: - View Life Cycle Supporters (Functions)
    
    func tableConfigurations() {
        cryptoTable.delegate = self
        cryptoTable.dataSource = self

        view.addSubview(cryptoTable)
    }
    
    func getDatas() {
        let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=f58d72f1d205f36cf25a831c3f349880bf5f119d&per-page=100&page=1")!
            
        APICaller().getCryptoCurrency(url: url) { (cryptos) in
            
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.cryptoTable.reloadData()
                }
            }
        }
    }
}

//MARK: - UITableView Delegate and DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoTable.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.titleLabel.text = cryptoViewModel.name
        cell.priceLabel.text = cryptoViewModel.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
