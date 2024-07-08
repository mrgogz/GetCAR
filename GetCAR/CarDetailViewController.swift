//
//  CarDetailViewController.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 8.07.2024.
//

import UIKit

struct Favorite{
    let brand: String
    let model: String
    let detailPageImage: String
}

class CarDetailViewController: UIViewController {
    
    private let carImageView = UIImageView()
    private let brandLabel = UILabel()
    private let modelLabel = UILabel()
    private let priceLabel = UILabel()
    private let yearLabel = UILabel()
    private let combinedLabel = UILabel()
    private let engineTypeLabel = UILabel()
    private let seatCapLabel = UILabel()
    private let engineSymbolImageView = UIImageView()
    private let transmissionSymbolImageView = UIImageView()
    private let seatSymbolImageView = UIImageView()
    
    private var car: Car?
    var favorites: [Favorite] = []
    
    func configure(car: Car) {
        carImageView.image = UIImage(named: car.detailPageImage)
        combinedLabel.text = "\(car.brand) \(car.model)"
        priceLabel.text = car.price
        yearLabel.text = car.year
        engineTypeLabel.text = car.engineType
        seatCapLabel.text = car.seatCap
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        configureNavigationBar()
        configureImageView()
        configureCombinedLabel()
        configureYearLabel()
        configurePriceLabel()
        configureEngineSymbol()
        configureSeatSymbol()
        configureEngineTypeLabel()
        configureSeatCapLabel()
    }
    
    func configureNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addFavorite))
    }
    
    @objc func addFavorite() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(addFavorite))
    }
    
    func configureImageView() {
        view.addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.clipsToBounds = true
        carImageView.contentMode = .scaleAspectFill
        carImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureCombinedLabel() {
        view.addSubview(combinedLabel)
        combinedLabel.translatesAutoresizingMaskIntoConstraints = false
        combinedLabel.font = UIFont.boldSystemFont(ofSize: 25)
        combinedLabel.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            combinedLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor,constant: -35),
            combinedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            combinedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureYearLabel() {
        view.addSubview(yearLabel)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: combinedLabel.bottomAnchor),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configurePriceLabel() {
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.boldSystemFont(ofSize: 25)
        combinedLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureEngineSymbol() {
        view.addSubview(engineSymbolImageView)
        engineSymbolImageView.translatesAutoresizingMaskIntoConstraints = false
        engineSymbolImageView.image = UIImage(systemName: "engine.combustion.fill")
        engineSymbolImageView.contentMode = .scaleAspectFit
        engineSymbolImageView.tintColor = .black
        
        NSLayoutConstraint.activate([
            engineSymbolImageView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 40),
            engineSymbolImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            engineSymbolImageView.widthAnchor.constraint(equalToConstant: 45),
            engineSymbolImageView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureSeatSymbol() {
        view.addSubview(seatSymbolImageView)
        seatSymbolImageView.translatesAutoresizingMaskIntoConstraints = false
        seatSymbolImageView.image = UIImage(systemName: "carseat.right.fill")
        seatSymbolImageView.contentMode = .scaleAspectFit
        seatSymbolImageView.tintColor = .black
        
        NSLayoutConstraint.activate([
            seatSymbolImageView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 40),
            seatSymbolImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            seatSymbolImageView.widthAnchor.constraint(equalToConstant: 45),
            seatSymbolImageView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    func configureEngineTypeLabel() {
        view.addSubview(engineTypeLabel)
        engineTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        engineTypeLabel.font = UIFont.boldSystemFont(ofSize: engineTypeLabel.font.pointSize)
        engineTypeLabel.numberOfLines = 0
        engineTypeLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            engineTypeLabel.topAnchor.constraint(equalTo: engineSymbolImageView.bottomAnchor, constant: 15),
            engineTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            engineTypeLabel.trailingAnchor.constraint(equalTo: seatSymbolImageView.leadingAnchor, constant: -45)
        ])
    }
    
    func configureSeatCapLabel() {
        view.addSubview(seatCapLabel)
        seatCapLabel.translatesAutoresizingMaskIntoConstraints = false
        seatCapLabel.font = UIFont.boldSystemFont(ofSize: engineTypeLabel.font.pointSize)
        seatCapLabel.numberOfLines = 0
        seatCapLabel.lineBreakMode = .byWordWrapping
        
        NSLayoutConstraint.activate([
            seatCapLabel.topAnchor.constraint(equalTo: seatSymbolImageView.bottomAnchor, constant: 15),
            seatCapLabel.leadingAnchor.constraint(equalTo: engineTypeLabel.trailingAnchor, constant: 60),
            seatCapLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
    }
}


