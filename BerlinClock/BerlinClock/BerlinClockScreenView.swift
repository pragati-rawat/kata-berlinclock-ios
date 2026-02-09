//
//  BerlinClockScreen.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import SwiftUI

struct BerlinClockScreenView: View {

    @StateObject private var viewModel: BerlinClockViewModel

    init(viewModel: BerlinClockViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        GeometryReader { geo in
            let availableWidth = geo.size.width - 32

            VStack(spacing: 24) {
                Spacer(minLength: 12)

                BerlinClockView(
                    state: viewModel.composedTimeState,
                    availableWidth: availableWidth
                )

                DigitalTimeView(text: viewModel.digitalTimeText)

                Spacer(minLength: 12)
            }
            .padding(.horizontal, 16)
            .onAppear { viewModel.start() }
            .onDisappear { viewModel.stop() }
        }
        .navigationTitle("Berlin Clock")
    }
}

// MARK: Helper for preveiw
#Preview("BerlinClockScreen") {
    BerlinClockScreenView(
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

