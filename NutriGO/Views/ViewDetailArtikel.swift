//
//  ViewDetailArtikel.swift
//  NutriGO
//
//  Created by MacBook Pro on 31/05/23.
//

import Foundation
import SwiftUI

struct ViewDetailArtikel: View {
    var artikel: Artikel
    var backButtonAction: () -> Void // Penanganan aksi tombol kembali
    
    var body: some View {
        VStack {
            // Konten tampilan detail artikel
            Image(artikel.imageName)
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(height: 300)
                          .cornerRadius(10)
                          .padding(.horizontal, 16)
                          .padding(.vertical, 20)
                      
                      VStack(alignment: .leading, spacing: 16) {
                          Text(artikel.judul)
                              .font(.title)
                              .foregroundColor(.black)
                              .padding(.horizontal, 16)
                          
                          Text(artikel.isi)
                              .foregroundColor(.black)
                              .padding(.horizontal, 16)
                      }
                      .padding(.vertical, 20)
            
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    backButtonAction() // Memanggil aksi tombol kembali
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .imageScale(.large)
                }
            }
        }
    }
}
