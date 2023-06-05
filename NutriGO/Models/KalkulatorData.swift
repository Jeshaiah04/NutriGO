//
//  KalkulatorData.swift
//  NutriGO
//
//  Created by MacBook Pro on 01/06/23.
//

import Foundation

struct KalkulatorData: Codable {
    var kalori: Double
    var protein: Double
    var karbohidrat: Double
    var lemak: Double
}

class StorageManager {
    static let shared = StorageManager()
    
    private let kalkulatorDataKey = "kalkulatorData"
    private let defaults = UserDefaults.standard
    
    func saveKalkulatorData(_ data: KalkulatorData) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            defaults.set(encodedData, forKey: kalkulatorDataKey)
        } catch {
            print("Failed to save kalkulator data: \(error)")
        }
    }
    
    func loadKalkulatorData() -> KalkulatorData? {
        guard let encodedData = defaults.object(forKey: kalkulatorDataKey) as? Data else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(KalkulatorData.self, from: encodedData)
            return data
        } catch {
            print("Failed to load kalkulator data: \(error)")
            return nil
        }
    }
}
