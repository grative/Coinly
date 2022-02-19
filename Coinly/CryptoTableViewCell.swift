import UIKit

class CryptoTableViewCell: UITableViewCell {
    
//MARK: - CryptoTableViewCell ID:
    
    static let identifier = "CryptoTableViewCell"
    
//MARK: - Basic Components of CryptoTableViewCell
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DENEME DENEME DENEME"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DENEME DENEME DENEME"
        return label
    }()

//MARK: - Override Section

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.backgroundColor = .systemBackground
        
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

//MARK: - Sizing Basic Components

extension CryptoTableViewCell {
    
    private func applyConstraints() {
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let priceLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
    }
}
