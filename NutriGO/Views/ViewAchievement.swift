//
//  ViewAchievement.swift
//  NutriGO
//
//  Created by MacBook Pro on 01/06/23.
//

import Foundation
import SwiftUI
import Combine
import UserNotifications

struct ViewAchievement: View {
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
