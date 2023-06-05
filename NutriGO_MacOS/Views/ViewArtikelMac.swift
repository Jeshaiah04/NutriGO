import Foundation
import SwiftUI

struct ViewArtikelMac: View {
    @StateObject var viewModel = ViewModelArtikel()
    @State private var selectedArtikel: Artikel? = nil
    @State private var selectedResep: Resep? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Daftar Artikel
                    Section(header: Text("Artikel Kesehatan").font(.title).foregroundColor(.black)) {
                        ForEach(viewModel.artikel) { artikel in
                            NavigationLink(destination: ViewDetailArtikelMac(artikel: artikel, backButtonAction: {
                                selectedArtikel = nil
                            })) {
                                VStack {
                                    Image(artikel.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                        .clipped()
                                    
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
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .cornerRadius(10)
                    
                    Divider()
                    
                    // Daftar Resep
                    Section(header: Text("Resep Sehat").font(.title).foregroundColor(.black)) {
                        ForEach(viewModel.resep) { resep in
                            NavigationLink(destination: ViewDetailResepMac(resep: resep, backButtonAction: {
                                selectedResep = nil
                            })) {
                                VStack {
                                    Image(resep.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                        .clipped()
                                    
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
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .cornerRadius(10)
                    
                    Divider()
                }
                .padding(.vertical, 20)
            }
            .padding()
            .navigationTitle("NutriGO")
        }
        .onAppear {
            viewModel.muatData()
        }
    }
}



