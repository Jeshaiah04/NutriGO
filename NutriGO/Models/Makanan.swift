//
//  Makanan.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import SwiftUI

// Makanan.swift
struct Makanan: Identifiable {
    let id = UUID()
    let nama: String
    let kalori: Int
    let waktuMakan: WaktuMakan
}


