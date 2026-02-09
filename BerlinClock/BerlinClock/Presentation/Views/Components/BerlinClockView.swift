//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct BerlinClockView: View {

    let state: BerlinClockComposeTimeState?
    let availableWidth: CGFloat

    var body: some View {
        VStack(spacing: 18) {

            // Seconds (single circular lamp)
            LampView(
                state: state?.seconds ?? .off,
                width: 120,
                height: 120,
                isCircle: true
            )

            // Hours (top row)
            LampRowView(
                lamps: state?.topHours ?? Array(repeating: .off, count: 4),
                availableWidth: availableWidth,
                lampHeight: 70,
                isCircle: false
            )

            // Hours (bottom row)
            LampRowView(
                lamps: state?.bottomHours ?? Array(repeating: .off, count: 4),
                availableWidth: availableWidth,
                lampHeight: 70,
                isCircle: false
            )

            // Minutes (top row – 11 lamps)
            LampRowView(
                lamps: state?.topMins ?? Array(repeating: .off, count: 11),
                availableWidth: availableWidth,
                lampHeight: 70,
                isCircle: false
            )

            // Minutes (bottom row)
            LampRowView(
                lamps: state?.bottomMins ?? Array(repeating: .off, count: 4),
                availableWidth: availableWidth,
                lampHeight: 70,
                isCircle: false
            )
        }
    }
}


#Preview("BerlinClockView – Nil state (all off)") {
    BerlinClockView(state: nil, availableWidth: 320)
        .padding()
}
