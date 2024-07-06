//
//  ViewController.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 5.07.2024.
//

import UIKit

struct Car {
    let brand: String
    let model: String
    let color: String
    let transmission: String
    let year: Int
    let price: String
    let image: String
}

class HomeViewController: UIViewController {
    
    var tableView = UITableView()
    let cars: [Car] = [
        .init(brand: "Audi", model: "Q8 e-tron Sportback", color: "Black", transmission: "Automatic", year: 2024, price: "$77,800", image: "AudiQ8_1"),
        .init(brand: "Lexus", model: "LS500", color: "Atomic Silver", transmission: "Automatic", year: 2024, price: "$79,335", image: "LS500_1")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 220
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.configure(car: cars[indexPath.row])
            return cell
        }

        // MARK: - UITableViewDelegate

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            
        }
}
