//
//  ViewKalkulatorMac.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

import Foundation
import Combine

// ViewKalkulator
struct ViewKalkulatorMac: View {
    @StateObject private var viewModel = ViewModelKalkulator()

    var body: some View {
        VStack {
            ProgressCircleView(progress: Binding<Int>(
                get: { Int(viewModel.progress) },
                set: { newValue in
                    viewModel.progress = Double(newValue)
                }
            ))
            .frame(width: 250, height: 250)
            .padding()
            
            Text("Target Kalori Harian: \(viewModel.targetKaloriInput)")
                .font(.largeTitle)
            
            Form {
                Section(header: Text("Kalkulator BMR")) {
                    TextField("Berat (kg)", text: $viewModel.beratInput)
                        .font(.title)
                    TextField("Tinggi (cm)", text: $viewModel.tinggiInput)
                        .font(.title)
                    TextField("Usia", text: $viewModel.usiaInput)
                        .font(.title)

                    Picker("Gender", selection: $viewModel.gender) {
                        Text("Pria").tag(Gender.pria)
                        Text("Wanita").tag(Gender.wanita)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .font(.title)
                }
                
                Section(header: Text("Hasil Perhitungan")) {
                    Text("BMR: \(viewModel.bmr, specifier: "%.0f")")
                        .font(.title)
                }
                
                Section(header: Text("Target Kalori Harian")) {
                    TextField("Target Kalori", text: $viewModel.targetKaloriInput)
                        .font(.title)
                }
            }
            
            Button(action: {
                viewModel.calculateBMR()
                viewModel.calculateProgress()
            }) {
                Text("Hitung")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(10)
            }
            .buttonStyle(FilledButtonStyle(color: .blue))
            .padding(.top)
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


struct ViewKalkulatorMac_Previews: PreviewProvider {
    static var previews: some View {
        ViewKalkulatorMac()
    }
}
