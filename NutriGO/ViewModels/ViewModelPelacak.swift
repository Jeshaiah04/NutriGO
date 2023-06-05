//
//  HalamanKeempatViewModel.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import SwiftUI

// ViewModel: ViewModelPelacak
class ViewModelPelacak: ObservableObject {
    @Published var makanan: [Makanan] = []
    
    // Menambahkan makanan baru
    func tambahMakanan(nama: String, kalori: Int, waktuMakan: WaktuMakan) {
        let makananBaru = Makanan(nama: nama, kalori: kalori, waktuMakan: waktuMakan)
        makanan.append(makananBaru)
    }
    
    // Menghapus makanan dari daftar
    func hapusMakanan(indexSet: IndexSet) {
        makanan.remove(atOffsets: indexSet)
    }
    
    // Menghitung total kalori untuk setiap waktu makan
      func totalKaloriPerWaktuMakan(waktuMakan: WaktuMakan) -> Int {
          let makananPerWaktuMakan = makanan.filter { $0.waktuMakan == waktuMakan }
          let totalKalori = makananPerWaktuMakan.reduce(0) { $0 + $1.kalori }
          return totalKalori
      }
}

// Enum: WaktuMakan
enum WaktuMakan: String, CaseIterable {
    case pagi = "Pagi"
    case siang = "Siang"
    case malam = "Malam"
}


