//
//  MockBerlinClockTimeComposerTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import Testing
import Foundation
@testable import BerlinClock

struct MockBerlinClockTimeComposer: BerlinClockTimeComposerProtocol {
    let stubbedState: BerlinClockComposeTimeState
    
    func composeClockTime(hours: Int,
                          minutes: Int,
                          seconds: Int) -> BerlinClockComposeTimeState {
        stubbedState
    }
}
