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
    
    @Test("Test for state not updated on subsequent calls to start")
    @MainActor
    func start_calledMultipleTimes_doesNotCreateDuplicateUpdates() {
        let service = MockBerlinClockService()
        
        let expectedState = BerlinClockComposeTimeState.empty()
        let composer = MockBerlinClockTimeComposer(stubbedState: expectedState)
        
        let viewModel = BerlinClockViewModel(
            clockService: service,
            composer: composer
        )
        
        // WHEN: start called twice
        viewModel.startEmittingTime()
        viewModel.startEmittingTime()
        
        // THEN: a single tick updates state once (still equals expected)
        service.simulateTick(
            at: BerlinDisplayClockTime(hours: 1, minutes: 1, seconds: 1)
        )
        
        #expect(viewModel.composedTimeState == expectedState)
    }
    
    @Test("Test for state to be nil when clock is stopped")
    func stop_preventsFurtherStateUpdates() {
        let service = MockBerlinClockService()
        let composer = MockBerlinClockTimeComposer(stubbedState: .empty())
        
        let viewModel = BerlinClockViewModel(
            clockService: service,
            composer: composer
        )
        
        viewModel.startEmittingTime()
        viewModel.stop()
        
        service.simulateTick(
            at: BerlinDisplayClockTime(hours: 5, minutes: 5, seconds: 5)
        )
        
        #expect(viewModel.composedTimeState == nil)
    }
    
    @Test("Test restart after stop restarts the clock and updates state")
    func restart_afterStop_updatesStateAgain() {
        let service = MockBerlinClockService()
        let expectedState = BerlinClockComposeTimeState.empty()
        let composer = MockBerlinClockTimeComposer(stubbedState: expectedState)
        
        let viewModel = BerlinClockViewModel(
            clockService: service,
            composer: composer
        )
        
        // start → stop
        viewModel.startEmittingTime()
        viewModel.stop()
        
        // restart
        viewModel.startEmittingTime()
        
        service.simulateTick(
            at: BerlinDisplayClockTime(hours: 2, minutes: 2, seconds: 2)
        )
        
        #expect(viewModel.composedTimeState == expectedState)
    }
    
    @Test("Test that it updates the digital time text when clock service emits time")
    func start_updatesDigitalTimeText_whenClockServiceEmitsTime() {
        let service = MockBerlinClockService()
        let composer = MockBerlinClockTimeComposer(stubbedState: .empty())
        
        let viewModel = BerlinClockViewModel(
            clockService: service,
            composer: composer
        )
        
        viewModel.startEmittingTime()
        
        service.simulateTick(
            at: BerlinDisplayClockTime(hours: 13, minutes: 28, seconds: 0)
        )
        
        #expect(viewModel.digitalTimeText == "13:28:00")
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
