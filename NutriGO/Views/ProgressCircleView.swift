//
//  ProgressCircleView.swift
//  NutriGO
//
//  Created by MacBook Pro on 01/06/23.
//

import Foundation
import SwiftUI
import Combine

struct ProgressCircleView: View {
    @Binding var progress: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0, to: CGFloat(min(Double(progress) / 100, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(progress)%")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
