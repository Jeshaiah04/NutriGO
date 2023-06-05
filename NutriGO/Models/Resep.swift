//
//  Resep.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import SwiftUI

// Resep.swift
struct Resep: Identifiable, Codable, Equatable {
    var id: UUID
    var nama: String
    var bahan: [String]
    var instruksi: String
    var imageName: String // Properti untuk menyimpan nama gambar

    enum CodingKeys: String, CodingKey {
        case id
        case nama
        case bahan
        case instruksi
        case imageName
    }
}

