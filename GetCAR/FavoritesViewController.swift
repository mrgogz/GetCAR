//
//  FavoritesViewController.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 5.07.2024.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    var collectionView: UICollectionView!
    var favoriteCars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadFavorites()
    }
    
    func loadFavorites() {
        favoriteCars = PersistentManager.shared.readData()
        collectionView.reloadData()
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteCars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.configure(car: favoriteCars[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCar = favoriteCars[indexPath.row]
        let vc = CarDetailViewController()
        vc.configure(car: Car(brand: selectedCar.brand, model: selectedCar.model, year: selectedCar.year, price: selectedCar.price, image: selectedCar.image, detailPageImage: selectedCar.detailPageImage, engineType: selectedCar.engineType, seatCap: selectedCar.seatCap))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 20, height: 200)
    }
}
