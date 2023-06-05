//
//  HalamanKetiga.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import Combine
import SwiftUI

// ViewKalkulator
struct ViewKalkulator: View {
    @StateObject private var viewModel = ViewModelKalkulator()

    var body: some View {
        VStack {
            
            ProgressCircleView(progress: Binding<Int>(
                get: { Int(viewModel.progress) },
                set: { newValue in
                    viewModel.progress = Double(newValue)
                }
            ))
            .frame(width: 200, height: 200)
            .padding()
            
            Text("Target Kalori Harian: \(viewModel.targetKaloriInput)")
                .font(.headline)
            
            Form {
                Section(header: Text("Kalkulator BMR")) {
                    TextField("Berat (kg)", text: $viewModel.beratInput)
                    TextField("Tinggi (cm)", text: $viewModel.tinggiInput)
                    TextField("Usia", text: $viewModel.usiaInput)

                    Picker("Gender", selection: $viewModel.gender) {
                        Text("Pria").tag(Gender.pria)
                        Text("Wanita").tag(Gender.wanita)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Hasil Perhitungan")) {
                    Text("BMR: \(viewModel.bmr, specifier: "%.0f")")
                }
                
                Section(header: Text("Target Kalori Harian")) {
                    TextField("Target Kalori", text: $viewModel.targetKaloriInput)
                }
            }

            Button(action: {
                viewModel.calculateBMR()
                viewModel.calculateProgress()
            }) {
                Text("Hitung")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            
        }
        .padding()
        .onAppear {
            viewModel.setDefaultValues()
        }
    }
}

enum Gender {
    case pria
    case wanita
}



