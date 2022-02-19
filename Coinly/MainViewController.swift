import UIKit

class MainViewController: UIViewController {
    
//MARK: - Basic Components of MainViewController
    
    private let cryptoTable: UITableView = {
        let table = UITableView()
        table.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return table
    }()

//MARK: - View Life Cycle (viewDidLoad)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableConfigurations()
        
    }

//MARK: - View Life Cycle (viewDidLayoutSubviews)

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cryptoTable.frame = view.bounds
        
    }

//MARK: - UITableView Delegate and DataSources
    
    func tableConfigurations() {
        cryptoTable.delegate = self
        cryptoTable.dataSource = self

        view.addSubview(cryptoTable)
    }
}

//MARK: - UITableView Delegate and DataSources

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoTable.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as! CryptoTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

}
