//
//  DataPengguna.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import SwiftUI

// DataPengguna.swift
struct DataPengguna {
    var berat: Double // dalam kilogram
    var tinggi: Double // dalam cm
    var umur: Int
    var aktivitas: AktivitasFisik
}

enum AktivitasFisik {
    case rendah, sedang, tinggi
}

