//
//  LampView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//

import SwiftUI

struct LampView: View {

    let state: LampState
    let width: CGFloat
    let height: CGFloat
    let isCircle: Bool

    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius,
            style: .continuous
        )
        .fill(fillColor)
        .overlay(
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
            .stroke(borderColor, lineWidth: 1)
        )
        .frame(width: width, height: height)
        .scaleEffect(state.isOn ? 1.0 : 0.95)
        .animation(animation, value: state)
        .accessibilityElement()
        .accessibilityLabel("Lamp")
        .accessibilityValue(accessibilityValue)
    }

    // MARK: - Computed helpers
    private var cornerRadius: CGFloat {
        isCircle ? height / 2 : 10
    }

    private var fillColor: Color {
        guard state.isOn, let color = state.lampColor else {
            return Color.secondary.opacity(colorScheme == .dark ? 0.25 : 0.18)
        }

        return color == .yellow ? .yellow : .red
    }

    private var borderColor: Color {
        Color.primary.opacity(colorScheme == .dark ? 0.35 : 0.18)
    }

    private var animation: Animation? {
        reduceMotion ? nil : .easeInOut(duration: 0.25)
    }

    private var accessibilityValue: String {
        switch state {
        case .off:
            return "Off"
        case .on(let color):
            return "On, \(color == .yellow ? "Yellow" : "Red")"
        }
    }
}

//MARK: PREVIEW
#Preview("LampView States") {
    VStack(spacing: 16) {
        LampView(state: .on(.yellow), width: 80, height: 80, isCircle: true)
        LampView(state: .on(.red), width: 80, height: 100, isCircle: false)
        LampView(state: .on(.yellow), width: 80, height: 100, isCircle: true)
    }
    .padding()
}

