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
    
    @Test("Test bottom row one lamp is on when hours is 1")
    func bottomHourRow_turnsOnOneLamp_forOneHour() {
        let engine = BerlinClockEngine()
        let result = engine.bottomHourRow(1)
        
        #expect(result == [.on(.red), .off, .off, .off])
    }
}
