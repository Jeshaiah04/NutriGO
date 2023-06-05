//
//  Artikel.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import SwiftUI

//Artikel.swift
struct Artikel: Identifiable, Codable, Equatable{
    var id: UUID
    var judul: String
    var isi: String
    var imageName: String // Properti untuk menyimpan nama gambar

    enum CodingKeys: String, CodingKey {
        case id
        case judul
        case isi
        case imageName
    }
}

