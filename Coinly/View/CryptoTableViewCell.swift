import UIKit

class CryptoTableViewCell: UITableViewCell {
      
//MARK: - Basic Components of CryptoTableViewCell
    
    //MARK: Components
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TRY ME"
        label.numberOfLines = 0
        return label
    }()
    
    public let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TRY ME"
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: Variables
    
    static let identifier = "CryptoTableViewCell"

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
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ]
        
        let priceLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
    }
}
