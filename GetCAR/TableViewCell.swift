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
        addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.clipsToBounds = true
        carImageView.contentMode = .scaleAspectFill
        carImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: topAnchor),
            carImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            carImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureBrandLabel() {
        addSubview(brandLabel)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.font = UIFont.boldSystemFont(ofSize: 16)
        brandLabel.numberOfLines = 1
        brandLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
