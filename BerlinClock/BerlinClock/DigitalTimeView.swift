//
//  DigitalTimeView.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct DigitalTimeView: View {

    let text: String

    var body: some View {
        Text(text.isEmpty ? "--:--:--" : text)
            .font(.system(.title, design: .monospaced).weight(.bold))
            .minimumScaleFactor(0.6)
            .lineLimit(1)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .accessibilityElement()
            .accessibilityLabel("Digital time")
            .accessibilityValue(accessibilityValue)
    }

    private var accessibilityValue: String {
        guard !text.isEmpty else { return "Not available" }
        return text
    }
}


#Preview("DigitalTimeView") {
    VStack(spacing: 16) {
        DigitalTimeView(text: "13:28:00")
        DigitalTimeView(text: "01:02:03")
        DigitalTimeView(text: "")
    }
    .padding()
}
