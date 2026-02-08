//
//  BerlinClockBottomMinutesTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

import Testing
@testable import BerlinClock

@Suite("BerlinClockBottomMinutes Tests")
@MainActor
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
    
    @Test("Test bottom minute row turns on two lamps for two minutes")
    func bottomMinuteRow_forTwoMinutes() {
        let engine = BerlinClockEngine()
        let result = engine.bottomMinuteRow(2)
        
        let expected: [LampState] = [.on(.yellow), .on(.yellow), .off, .off]
        #expect(result == expected)
    }
    
    @Test("Test bottom minute row turns on three lamps for three minutes")
    func bottomMinuteRow_forThreeMinutes() {
        let engine = BerlinClockEngine()
        let result = engine.bottomMinuteRow(3)
        
        let expected: [LampState] = [.on(.yellow), .on(.yellow), .on(.yellow), .off]
        #expect(result == expected)
    }
    
    @Test("Test bottom minute row turns on four lamps for three minutes")
    func bottomMinuteRow_forFourMinutes() {
        let engine = BerlinClockEngine()
        let result = engine.bottomMinuteRow(4)
        
        let expected: [LampState] = [.on(.yellow), .on(.yellow), .on(.yellow), .on(.yellow)]
        #expect(result == expected)
    }
    
    @Test("Test bottom minute row count for 1-4 minutes", arguments: [1, 2, 3, 4])
    func bottomMinuteRow_countsLampsCorrectly(minutes: Int) {
        let engine = BerlinClockEngine()
        let result = engine.bottomMinuteRow(minutes)
        
        // Check that the number of .on(.yellow) states matches the minutes
        let onCount = result.filter { $0 == .on(.yellow) }.count
        #expect(onCount == minutes)
        
        // Check that the remaining lamps are .off
        let offCount = result.filter { $0 == .off }.count
        #expect(offCount == (4 - minutes))
    }
}
