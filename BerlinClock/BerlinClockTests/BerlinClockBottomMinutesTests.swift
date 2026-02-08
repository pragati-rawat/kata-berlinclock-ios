//
//  BerlinClockBottomMinutesTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

import Testing
@testable import BerlinClock

@Suite("BerlinClockBottomMinutes Tests")
struct BerlinClockBottomMinutesTests {
    
    @Test("Test bottom minute row is all off when minute is zero")
    func bottomMinuteRow_isAllOff_whenMinutesIsZero() {
        let engine = BerlinClockEngine()
        
        let result = engine.bottomMinuteRow(0)
        
        #expect(result.count == 4)
        #expect(result.allSatisfy { $0 == .off })
    }
    
    @Test("Test bottom minute row is turns on oNe lamp for one minute")
    func bottomMinuteRow_turnsOnOneLamp_forOneMinute() {
        let engine = BerlinClockEngine()
        
        let result = engine.bottomMinuteRow(1)
        
        #expect(result[0] == .on(.yellow))
        #expect(result[1] == .off)
        #expect(result[2] == .off)
        #expect(result[3] == .off)
    }
}
