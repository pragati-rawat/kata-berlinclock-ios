//
//  LampRowView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct LampRowView: View {

    let title: String
    let lamps: [LampState]

    var body: some View {
        HStack(spacing: 10) {
            ForEach(Array(lamps.enumerated()), id: \.offset) { index, lamp in
                LampView(state: lamp)
                    .accessibilityLabel("\(title) lamp \(index + 1)")
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(title)
        .accessibilityValue(accessibilitySummary)
    }

    private var accessibilitySummary: String {
        let onCount = lamps.filter {
            if case .on = $0 { return true }
            return false
        }.count

        return "\(onCount) on, \(lamps.count - onCount) off"
    }
}

#Preview("LampRowView") {
    VStack(spacing: 24) {
        // Seconds (1 lamp)
        LampRowView(
            title: "Seconds",
            lamps: [.on(.yellow)]
        )

        // Top minutes (11 lamps with quarters)
        LampRowView(
            title: "Top Minutes",
            lamps: [
                .on(.yellow), .on(.yellow), .on(.red), .on(.yellow), .on(.yellow),
                .on(.red), .off, .off, .off, .off, .off
            ]
        )

        // Bottom minutes (4 lamps)
        LampRowView(
            title: "Bottom Minutes",
            lamps: [.on(.yellow), .off, .off, .off]
        )
    }
    .padding()
}
