//
//  HalamanKedua.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import UserNotifications
import SwiftUI

//Halaman Pengingat Air
struct ViewAir: View {
    @StateObject var viewModel = ViewModelAir()
    @State private var isShowingAlarmView = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Air yang Telah Anda Minum")
                .font(.headline)
            Text("\(viewModel.airMinum.jumlah, specifier: "%.0f") ml")
                .font(.title)
            
            Slider(value: $viewModel.airMinum.jumlah, in: 0...viewModel.maxJumlah, step: 100)
                .padding()
            
            Button(action: {
                viewModel.submitJumlah()
            }) {
                Text("Simpan")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            if viewModel.isAchievementUnlocked {
                Text("Selamat! Anda telah mencapai pencapaian air minum")
                    .font(.headline)
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
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            List(viewModel.logMinumAir, id: \.id) { log in
                HStack {
                    Text("Minum \(String(format: "%.0f", log.jumlah)) ml")
                    Spacer()
                    Text(log.timeStamp, style: .time)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 20)
        }
        .padding()
        .sheet(isPresented: $isShowingAlarmView) {
            ViewAlarm()
        }
        .onAppear {
            viewModel.requestNotificationAuthorization()
            viewModel.scheduleNotification()
        }
    }
}
