//
//  HalamanKeduaViewModel.swift
//  NutriGO
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation
import Combine
import UserNotifications
import SwiftUI

// Pengingat Air Minum ViewModel
class ViewModelAir: ObservableObject {
    @Published var airMinum = AirMinum(jumlah: 0)
    @Published var logMinumAir: [AirLog] = []
    var timer = Timer.publish(every: 15 * 60, on: .main, in: .common).autoconnect()
    @Published var isAchievementUnlocked = false
    let maxJumlah: Double = 2000 // Jumlah maksimal air minum yang dapat diinput
    
    let achievementThreshold: Double = 2000 // Jumlah air minum untuk mencapai pencapaian
    
    init() {
        timer.sink { [weak self] _ in
            self?.sendNotification()
        }
        .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func aturJumlah(jumlah: Double) {
        airMinum.jumlah = jumlah
        checkAchievement()
    }
    
    func submitJumlah() {
        let log = AirLog(jumlah: airMinum.jumlah, timeStamp: Date())
        logMinumAir.append(log)
        
        let content = UNMutableNotificationContent()
        content.title = "Ingat Minum!"
        content.body = "Waktunya minum air lagi."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 900, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        checkAchievement()
    }
    
    private func checkAchievement() {
        if airMinum.jumlah >= achievementThreshold {
            isAchievementUnlocked = true
        } else {
            isAchievementUnlocked = false
        }
    }
    
    private func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Ingat Minum!"
        content.body = "Waktunya minum air lagi."
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Ingat Minum!"
        content.body = "Waktunya minum air."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 900, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct AirLog: Identifiable {
    let id = UUID()
    let jumlah: Double
    let timeStamp: Date
}
