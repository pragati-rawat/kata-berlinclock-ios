//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import Testing
import Foundation
@testable import BerlinClock

@Suite("BerlinClockViewModel Tests")
struct BerlinClockViewModelTests {

    @Test("Test for initial state is nil")
    func initialState_isNil() {
        let clockService = MockBerlinClockService()
        let composer = MockBerlinClockTimeComposer(stubbedState: .empty())

        let viewModel = BerlinClockViewModel(
            clockService: clockService,
            composer: composer
        )

        #expect(viewModel.composedTimeState == nil)
    }
}

// MARK: Helper functions
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
