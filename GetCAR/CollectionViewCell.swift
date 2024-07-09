//
//  CollectionViewCell.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 6.07.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let carImageView = UIImageView()
    let brandLabel = UILabel()
    let modelLabel = UILabel()
    let priceLabel = UILabel()
    let combinedLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureImageView()
        configureCombinedLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(car: Car) {
        carImageView.image = UIImage(named: car.image)
        combinedLabel.text = "\(car.brand) \(car.model)"
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
            carImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureCombinedLabel() {
        addSubview(combinedLabel)
        combinedLabel.translatesAutoresizingMaskIntoConstraints = false
        combinedLabel.font = UIFont.boldSystemFont(ofSize: 16)
        combinedLabel.numberOfLines = 1
        combinedLabel.lineBreakMode = .byTruncatingTail
        
        NSLayoutConstraint.activate([
            combinedLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor),
            combinedLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            combinedLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
