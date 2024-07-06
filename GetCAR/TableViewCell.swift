//
//  TableViewCell.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 5.07.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let carImageView = UIImageView()
    let brandLabel = UILabel()
    let modelLabel = UILabel()
    let priceLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        configureImageView()
    }
    
    func configure(car: Car) {
        carImageView.image = UIImage(named: car.image)
        brandLabel.text = car.brand
        modelLabel.text = car.model
        priceLabel.text = car.price
        
    }
    
    func configureImageView() {
        contentView.addSubview(carImageView)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
