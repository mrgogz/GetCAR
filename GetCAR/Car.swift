//
//  Car.swift
//  GetCAR
//
//  Created by Oğuzcan Beşerikli on 9.07.2024.
//

import Foundation


struct Car: Codable, Equatable {
    let brand: String
    let model: String
    let year: String
    let price: String
    let image: String
    let detailPageImage: String
    let engineType: String
    let seatCap: String
}


struct PersistentManager {
    static let shared = PersistentManager()
    func saveData(data: [Car]) {
        do {
            let data = try JSONEncoder().encode(data)
            UserDefaults.standard.setValue(data, forKey: "data")
        }
        catch{
            print("Error encoding data: \(error)")
        }
    }
    
    func readData() -> [Car] {
        do{
            if let savedData = UserDefaults.standard.data(forKey: "data") {
                return try JSONDecoder().decode([Car].self, from: savedData)
            }
        }
        catch{
            print("Error decoding data: \(error)")
            return []
        }
        return []
    }
}
