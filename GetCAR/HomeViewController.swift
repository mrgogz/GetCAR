//
//  ViewController.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 5.07.2024.
//

import UIKit


class HomeViewController: UIViewController {
    
    var collectionView : UICollectionView!
    let cars: [Car] = [
        .init(brand: "Audi", model: "Q8 e-tron Sportback", year: "2024", price: "$77,800", image: "AudiQ8_1",detailPageImage: "AudiQ8_2", engineType: "Electric", seatCap: "7"),
        .init(brand: "Lexus", model: "LS500", year: "2024", price: "$79,335", image: "LS500_1",detailPageImage: "LS500_2", engineType: "Twin Turbo Premium Unleaded V-6", seatCap: "5"),
        .init(brand: "BMW", model: "X4", year: "2024", price: "$79,100", image: "BMWX4_1", detailPageImage: "BMWX4_2", engineType: "Twin Turbo Premium Unleaded I-6", seatCap: "5"),
        .init(brand: "Jaguar", model: "F-Type", year: "2024", price: "$77,900", image: "JaguarF_1", detailPageImage: "JaguarF_2", engineType: "Intercooled Supercharger Premium Unleaded V-8", seatCap: "2"),
        .init(brand: "BMW", model: "M8", year: "2024", price: "$138,800", image: "BMWM8_1", detailPageImage: "BMWM8_2", engineType: "Twin Turbo Premium Unleaded V-8", seatCap: "5"),
        .init(brand: "Volvo", model: "S90", year: "2024", price: "$65,650", image: "VolvoS90_1", detailPageImage: "VolvoS90_2", engineType: "Intercooled Turbo Gas/Electric I-4", seatCap: "5"),
        .init(brand: "Fiat", model: "500e", year: "2024", price: "$32,500", image: "FIAT500e_1", detailPageImage: "FIAT500e_2", engineType: "Electric", seatCap: "4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return cars.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.configure(car: cars[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCar = cars[indexPath.row]
        let vc = CarDetailViewController()
        vc.configure(car: selectedCar)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 20, height: 250)
    }
}
