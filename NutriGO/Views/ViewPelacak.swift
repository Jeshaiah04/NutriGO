//
//  HalamanKeempat.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation

import SwiftUI

//Halaman Pelacak Makanan
// View: ViewPelacak
struct ViewPelacak: View {
    @StateObject private var viewModel = ViewModelPelacak()
    @State private var namaMakanan: String = ""
    @State private var kaloriMakanan: String = ""
    @State private var selectedWaktuMakan: WaktuMakan = .pagi
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Tambah Makanan")) {
                        TextField("Nama Makanan", text: $namaMakanan)
                        TextField("Kalori", text: $kaloriMakanan)
                            .keyboardType(.numberPad)
                        Picker("Waktu Makan", selection: $selectedWaktuMakan) {
                            ForEach(WaktuMakan.allCases, id: \.self) { waktuMakan in
                                Text(waktuMakan.rawValue).tag(waktuMakan)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Makanan")) {
                        ForEach(viewModel.makanan) { makanan in
                            if makanan.waktuMakan == selectedWaktuMakan {
                                Text("\(makanan.nama) - \(makanan.kalori) Kalori")
                            }
                        }
                        .onDelete(perform: viewModel.hapusMakanan)
                    }
                    
                    Section(header: Text("Total Kalori")) {
                                            Text("Pagi: \(viewModel.totalKaloriPerWaktuMakan(waktuMakan: .pagi)) Kalori")
                                            Text("Siang: \(viewModel.totalKaloriPerWaktuMakan(waktuMakan: .siang)) Kalori")
                                            Text("Malam: \(viewModel.totalKaloriPerWaktuMakan(waktuMakan: .malam)) Kalori")
                                        }
                    
                }
                .navigationBarTitle("Pelacak Makanan")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            tambahMakanan()
                            clearInput()
                        }) {
                            Text("Tambah")
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private func tambahMakanan() {
        guard let kalori = Int(kaloriMakanan) else { return }
        viewModel.tambahMakanan(nama: namaMakanan, kalori: kalori, waktuMakan: selectedWaktuMakan)
    }
    
    private func clearInput() {
        namaMakanan = ""
        kaloriMakanan = ""
    }
}

struct ViewPelacak_Previews: PreviewProvider {
    static var previews: some View {
        ViewPelacak()
    }
}

struct BarisMakanan: View {
    let makanan: Makanan
    
    var body: some View {
        HStack {
            Text(makanan.nama)
                .font(.headline)
            Spacer()
            Text("\(makanan.kalori) kal")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}
