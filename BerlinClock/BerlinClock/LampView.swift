//
//  LampView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//

import SwiftUI

struct LampView: View {
    let state: LampState
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
            .fill(fillColor)
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
            )
            .frame(width: 28, height: 28)
            .accessibilityElement()
            .accessibilityLabel("Lamp")
            .accessibilityValue(accessibilityValue)
    }

    private var fillColor: Color {
        switch state {
        case .off:
            return Color.secondary.opacity(colorScheme == .dark ? 0.25 : 0.18)
        case .on(let color):
            switch color {
            case .yellow:
                return .yellow
            case .red:
                return .red
            }
        }
    }

    private var borderColor: Color {
        Color.primary.opacity(colorScheme == .dark ? 0.35 : 0.18)
    }

    private var accessibilityValue: String {
        switch state {
        case .off:
            return "Off"
        case .on(let color):
            switch color {
            case .yellow:
                return "On, Yellow"
            case .red:
                return "On, Red"
            }
        }
    }
}

#Preview("LampView States") {
    VStack(spacing: 16) {
        LampView(state: .on(.yellow))
        LampView(state: .on(.red))
        LampView(state: .off)
    }
    .padding()
}
