//
//  ViewPelacakMac.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//
import SwiftUI
import Combine

struct ViewPelacakMac: View {
    @StateObject private var viewModel = ViewModelPelacak()
    @State private var namaMakanan: String = ""
    @State private var kaloriMakanan: String = ""
    @State private var selectedWaktuMakan: WaktuMakan = .pagi
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Tambah Makanan").font(.title)) {
                    TextField("Nama Makanan", text: $namaMakanan)
                        .font(.title)
                    TextField("Kalori", text: $kaloriMakanan)
                        .onReceive(Just(kaloriMakanan)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.kaloriMakanan = filtered
                            }
                        }
                        .font(.title)
                    Picker("Waktu Makan", selection: $selectedWaktuMakan) {
                        ForEach(WaktuMakan.allCases, id: \.self) { waktuMakan in
                            Text(waktuMakan.rawValue).tag(waktuMakan)
                                .font(.title)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        tambahMakanan()
                        clearInput()
                    }) {
                        Text("Simpan")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .buttonStyle(FilledButtonStyle(color: .blue))
                    
                }
                
                Section(header: Text("Makanan").font(.title)) {
                    ForEach(viewModel.makanan) { makanan in
                        if makanan.waktuMakan == selectedWaktuMakan {
                            Text("\(makanan.nama) - \(makanan.kalori) Kalori")
                                .font(.title)
                        }
                    }
                    .onDelete(perform: viewModel.hapusMakanan)
                }
                
                Section(header: Text("Total Kalori").font(.title)) {
                    Text("Pagi: \(viewModel.totalKaloriPerWaktuMakan(waktuMakan: .pagi)) Kalori")
                        .font(.title)
                    Text("Siang: \(viewModel.totalKaloriPerWaktuMakan(waktuMakan: .siang)) Kalori")
                        .font(.title)
                    Text("Malam: \(viewModel.totalKaloriPerWaktuMakan(waktuMakan: .malam)) Kalori")
                        .font(.title)
                }
            }
            .listStyle(DefaultListStyle())
            .navigationTitle("Pelacak Makanan")
            .frame(minWidth: 1500, minHeight: 400)
            .padding()
            
            Spacer()
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





