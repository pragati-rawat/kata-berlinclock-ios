//
//  BerlinClockBottomHoursTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

import Testing
@testable import BerlinClock

@Suite("BerlinClockBottomRowHours Tests")
@MainActor
struct BerlinClockBottomHoursTests {

    @Test("Test bottom row lamp is all off when hours is 0")
    func bottomHourRow_isAllOff_whenHoursIsZero() {
        let engine = BerlinClockEngine()
        let result = engine.bottomHourRow(0)
        #expect(result.count == 4)
        #expect(result.allSatisfy { $0 == .off })
    }
}
