//
//  ViewAirMac.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import UserNotifications
import SwiftUI

struct ViewAirMac: View {
    @StateObject var viewModel = ViewModelAir()
    @State private var isShowingAlarmView = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Air yang Telah Anda Minum")
                .font(.title)
            
            Text("\(viewModel.airMinum.jumlah, specifier: "%.0f") ml")
                .font(.system(size: 48, weight: .bold))
            
            Slider(value: $viewModel.airMinum.jumlah, in: 0...viewModel.maxJumlah, step: 100)
                .padding(.horizontal)
            
            Button(action: {
                viewModel.submitJumlah()
            }) {
                Text("Simpan")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .font(.headline)
            }
            .buttonStyle(FilledButtonStyle(color: .blue))
            
            if viewModel.isAchievementUnlocked {
                Text("Selamat! Anda telah mencapai pencapaian air minum")
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Button(action: {
                isShowingAlarmView = true
            }) {
                Text("Set Alarm")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .font(.headline)
            }
            .buttonStyle(FilledButtonStyle(color: .blue))
            
            List(viewModel.logMinumAir, id: \.id) { log in
                HStack {
                    Text("Minum \(String(format: "%.0f", log.jumlah)) ml")
                        .font(.headline)
                    Spacer()
                    Text(log.timeStamp, style: .time)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .padding(.top, 20)
        }
        .padding(40)
        .sheet(isPresented: $isShowingAlarmView) {
            ViewAlarmMac()
        }
        .onAppear {
            viewModel.requestNotificationAuthorization()
            viewModel.scheduleNotification()
        }
    }
}

struct FilledButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .cornerRadius(10)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}



