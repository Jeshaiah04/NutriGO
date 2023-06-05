//
//  HalamanPertamaViewModel.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation

import SwiftUI

//Artikel ViewModel
class ViewModelArtikel: ObservableObject {
    @Published var artikel: [Artikel] = []
    @Published var resep: [Resep] = []

    func muatData() {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let hasil = try decoder.decode(Hasil.self, from: data)
                self.artikel = hasil.artikel
                self.resep = hasil.resep
            } catch {
                print("Error membaca file: \(error)")
            }
        }
    }
}

