//
//  ViewAlarmMac.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import SwiftUI
import UserNotifications

struct ViewAlarmMac: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTime = Date()

    var body: some View {
        VStack(spacing: 20) {
            DatePicker("Pilih Waktu", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(DefaultDatePickerStyle()) // Apply a different style here
            
            Button(action: {
                scheduleNotification()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Set Alarm")
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func scheduleNotification() {
        // Schedule notification code remains the same
        let content = UNMutableNotificationContent()
        content.title = "Waktunya Minum Air!"
        content.body = "Jangan lupa untuk minum air."
        content.sound = UNNotificationSound.default

        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: selectedTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
