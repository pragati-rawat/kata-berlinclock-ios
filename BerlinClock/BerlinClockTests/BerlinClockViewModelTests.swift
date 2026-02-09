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
    
    @Test("Test for state updates when clock service emits time")
    @MainActor
    func start_updatesState_whenClockServiceEmitsTime() {
        let service = MockBerlinClockService()
        
        let expectedState = BerlinClockComposeTimeState.empty()
        let composer = MockBerlinClockTimeComposer(stubbedState: expectedState)
        
        let viewModel = BerlinClockViewModel(
            clockService: service,
            composer: composer
        )
        
        // WHEN
        viewModel.startEmittingTime()
        
        service.simulateTick(
            at: BerlinDisplayClockTime(hours: 10, minutes: 15, seconds: 20)
        )
        
        // THEN
        #expect(viewModel.composedTimeState == expectedState)
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
