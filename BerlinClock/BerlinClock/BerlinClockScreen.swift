//
//  BerlinClockScreen.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct BerlinClockScreen: View {

    @StateObject private var viewModel: BerlinClockViewModel

    init(viewModel: BerlinClockViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 18) {
            BerlinClockView(state: viewModel.composedTimeState)
            DigitalTimeView(text: viewModel.digitalTimeText)
        }
        .padding()
        .navigationTitle("Berlin Clock")
        .onAppear {
            viewModel.start()
        }
        .onDisappear {
            viewModel.stop()
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Berlin Clock screen")
    }
}

#Preview("BerlinClockScreen") {
    BerlinClockScreen(
        viewModel: BerlinClockViewModel(
            clockService: PreviewBerlinClockService(),
            composer: PreviewBerlinClockComposer()
        )
    )
}

struct PreviewBerlinClockComposer: BerlinClockTimeComposerProtocol {
    func composeClockTime(hours: Int, minutes: Int, seconds: Int) -> BerlinClockComposeTimeState {
        .empty()
    }
}

final class PreviewBerlinClockService: BerlinClockServiceProtocol {
    func now() -> BerlinDisplayClockTime { .init(hours: 13, minutes: 28, seconds: 0) }
    func start(onTick: @escaping (BerlinDisplayClockTime) -> Void) {}
    func stop() {}
}

extension BerlinClockComposeTimeState {
    static func empty() -> BerlinClockComposeTimeState {
        BerlinClockComposeTimeState (
            seconds: .off,
            topMins: Array(repeating: .off, count: 11),
            bottomMins: Array(repeating: .off, count: 4),
            topHours: Array(repeating: .off, count: 4),
            bottomHours: Array(repeating: .off, count: 4)
        )
    }
}

