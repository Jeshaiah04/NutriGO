//
//  HalamanPertama.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import SwiftUI

struct ViewArtikel: View {
    enum Category: Identifiable {
        case artikel
        case resep
        
        var id: Category { self }
    }
    
    @StateObject var viewModel = ViewModelArtikel()
    @State private var selectedCategory: Category? = nil
    @State private var selectedArtikel: Artikel? = nil
    @State private var selectedResep: Resep? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Daftar Artikel
                Section(header: Text("Artikel Kesehatan").font(.title)) {
                    ForEach(viewModel.artikel) { artikel in
                        VStack {
                            Image(artikel.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2)
                                )
                                .padding(.vertical, 8)
                                .onTapGesture {
                                    selectedCategory = .artikel
                                    selectedArtikel = artikel
                                }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(artikel.judul)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text(artikel.isi)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 16)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                Divider()
                
                // Daftar Resep
                Section(header: Text("Resep Sehat").font(.title)) {
                    ForEach(viewModel.resep) { resep in
                        VStack {
                            Image(resep.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.green, lineWidth: 2)
                                )
                                .padding(.vertical, 8)
                                .onTapGesture {
                                    selectedCategory = .resep
                                    selectedResep = resep
                                }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(resep.nama)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                ForEach(resep.bahan, id: \.self) { bahan in
                                    Text("• \(bahan)")
                                        .foregroundColor(.black)
                                }
                                
                                Text(resep.instruksi)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 16)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                Divider()
            }
            .padding(.vertical, 20)
        }
        .padding()
        .sheet(item: $selectedCategory) { category in
            NavigationView {
                switch category {
                case .artikel:
                    if let artikel = selectedArtikel {
                        ViewDetailArtikel(artikel: artikel) {
                            selectedCategory = nil // Memanggil aksi tombol kembali
                        }
                        .navigationBarTitle("Detail Artikel", displayMode: .inline)
                        .navigationBarItems(trailing: EmptyView()) // Menghapus tombol bawaan kembali
                    }
                case .resep:
                    if let resep = selectedResep {
                        ViewDetailResep(resep: resep) {
                            selectedCategory = nil // Memanggil aksi tombol kembali
                        }
                        .navigationBarTitle("Detail Resep", displayMode: .inline)
                        .navigationBarItems(trailing: EmptyView()) // Menghapus tombol bawaan kembali
                    }
                }
            }
        }


        .onAppear {
            viewModel.muatData()
        }
    }
}
