//
//  HalamanKetigaViewModel.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import Combine
import SwiftUI

// ViewModelKalkulator
class ViewModelKalkulator: ObservableObject {
    @Published var beratInput: String = ""
    @Published var tinggiInput: String = ""
    @Published var usiaInput: String = ""
    @Published var gender: Gender = .pria
    @Published var targetKaloriInput: String = ""

    @Published var bmr: Double = 0
    @Published var progress: Double = 0

    func setDefaultValues() {
        beratInput = ""
        tinggiInput = ""
        usiaInput = ""
        gender = .pria
        targetKaloriInput = ""
        bmr = 0
        progress = 0
    }

    func calculateBMR() {
        let berat = Double(beratInput) ?? 0
        let tinggi = Double(tinggiInput) ?? 0
        let usia = Double(usiaInput) ?? 0
        
        if gender == .pria {
            bmr = 88.362 + (13.397 * berat) + (4.799 * tinggi) - (5.677 * usia)
        } else {
            bmr = 447.593 + (9.247 * berat) + (3.098 * tinggi) - (4.330 * usia)
        }
    }

    func calculateProgress() {
        let targetKalori = Double(targetKaloriInput) ?? 0
        progress = (targetKalori / bmr) * 100
    }
}
