//
//  ViewDetailResepMac.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import SwiftUI

struct ViewDetailResepMac: View {
    var resep: Resep
    var backButtonAction: () -> Void // Penanganan aksi tombol kembali
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            // Konten tampilan detail resep
            
            Image(resep.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(resep.nama)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                
                ForEach(resep.bahan, id: \.self) { bahan in
                    Text("• \(bahan)")
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                }
                
                Text(resep.instruksi)
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Adjust the frame to occupy the available space
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    backButtonAction() // Memanggil aksi tombol kembali
                    presentationMode.wrappedValue.dismiss() // Dismiss the view
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.green)
                        .imageScale(.large)
                }
                .buttonStyle(PlainButtonStyle()) // Use a plain button style to remove the default button appearance
            }
        }
    }
}
