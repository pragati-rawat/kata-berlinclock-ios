//
//  LampRowView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct LampRowView: View {

    let lamps: [LampState]
    let availableWidth: CGFloat
    let lampHeight: CGFloat
    let isCircle: Bool

    private let spacing: CGFloat = 8

    var body: some View {
        let lampWidth = calculateLampWidth()

        HStack(spacing: spacing) {
            ForEach(Array(lamps.enumerated()), id: \.offset) { _, lamp in
                LampView(
                    state: lamp,
                    width: lampWidth,
                    height: lampHeight,
                    isCircle: isCircle
                )
            }
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }

    private func calculateLampWidth() -> CGFloat {
        let count = CGFloat(lamps.count)
        let totalSpacing = spacing * (count - 1)
        return (availableWidth - totalSpacing) / count
    }
}

//MARK: PREVIEW 

#Preview("LampRowView") {
    GeometryReader { proxy in
        let width = proxy.size.width - 32

        VStack(spacing: 24) {

            // Seconds (circle, single lamp)
            LampRowView(
                lamps: [.on(.yellow)],
                availableWidth: 80,
                lampHeight: 80,
                isCircle: true
            )

            // Top minutes (11 lamps)
            LampRowView(
                lamps: [
                    .on(.yellow), .on(.yellow), .on(.red), .on(.yellow), .on(.yellow),
                    .on(.red), .off, .off, .off, .off, .off
                ],
                availableWidth: width,
                lampHeight: 70,
                isCircle: false
            )

            // Bottom minutes (4 lamps)
            LampRowView(
                lamps: [.on(.yellow), .off, .off, .off],
                availableWidth: width,
                lampHeight: 70,
                isCircle: false
            )
        }
        .padding()
    }
}

