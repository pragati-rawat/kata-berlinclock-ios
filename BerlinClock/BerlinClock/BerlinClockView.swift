//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct BerlinClockView: View {
    let state: BerlinClockComposeTimeState?

    var body: some View {
        VStack(spacing: 14) {

            // Seconds (1 lamp)
            LampRowView(
                title: "Seconds",
                lamps: secondsRow
            )

            // Hours
            LampRowView(
                title: "Top Hours",
                lamps: state?.topHours ?? Array(repeating: .off, count: 4)
            )

            LampRowView(
                title: "Bottom Hours",
                lamps: state?.bottomHours ?? Array(repeating: .off, count: 4)
            )

            // Minutes
            LampRowView(
                title: "Top Minutes",
                lamps: state?.topMins ?? Array(repeating: .off, count: 11)
            )

            LampRowView(
                title: "Bottom Minutes",
                lamps: state?.bottomMins ?? Array(repeating: .off, count: 4)
            )
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Berlin Clock")
    }

    private var secondsRow: [LampState] {
        [state?.seconds ?? .off]
    }
}

#Preview("BerlinClockView – Nil state (all off)") {
    BerlinClockView(state: nil)
        .padding()
}
