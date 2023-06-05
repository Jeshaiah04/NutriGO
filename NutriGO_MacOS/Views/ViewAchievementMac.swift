//
//  ViewAchievementMac.swift
//  NutriGO_MacOS
//
//  Created by MacBook Pro on 02/06/23.
//

import Foundation
import SwiftUI
import Combine
import UserNotifications

struct ViewAchievementMac: View {
    @EnvironmentObject var viewModel: ViewModelAir

    var body: some View {
        VStack {
            Text("Achievement")
                .font(.headline)
            
            if viewModel.isAchievementUnlocked {
                Text("Congratulations! You reached \(viewModel.achievementThreshold) ml of water intake.")
                    .font(.subheadline)
                    .foregroundColor(.green)
            } else {
                Text("Keep drinking water to reach \(viewModel.achievementThreshold) ml.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

