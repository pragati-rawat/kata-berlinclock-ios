//
//  BerlinClockTopRowHoursTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

import Testing
@testable import BerlinClock

@Suite("BerlinClockTopRowHours Tests")
@MainActor
struct BerlinClockTopRowHoursTests {

    @Test("Test top hour row is all off when hour is zero")
    func topHourRow_isAllOff_whenHoursIsZero() {
        let engine = BerlinClockEngine()

        let result = engine.topHourRow(0)

        #expect(result.count == 4)
        #expect(result.allSatisfy { $0 == .off })
    }
    
    @Test("Test top hour row one lamp is on for five hours")
      func topHourRow_turnsOnOneLamp_forFiveHours() {
          let engine = BerlinClockEngine()

          let result = engine.topHourRow(5)
          let expected: [LampState] = [.on(.red), .off, .off, .off]
          #expect(result == expected)
      }
    
    @Test("Test top hour row two lamp is on for ten hours")
    func topHourRow_turnsOnTwoLamp_fortenHours() {
        let engine = BerlinClockEngine()
        
        let result = engine.topHourRow(10)
        let expected: [LampState] = [.on(.red), .on(.red), .off, .off]
        #expect(result == expected)
    }
    
    
    @Test("Test top hour row is three lamp is on when fifteen hours")
    func topHourRow_turnsOnThreeLamp_forFifteenHours() {
        let engine = BerlinClockEngine()
        
        let result = engine.topHourRow(15)
        let expected: [LampState] = [.on(.red), .on(.red), .on(.red), .off]
        #expect(result == expected)
    }
    
    @Test("Test top hour row is three lamp is on when fifteen hours")
    func topHourRow_turnsOnAllFourLamp_fortwentyHours() {
        let engine = BerlinClockEngine()
        
        let result = engine.topHourRow(20)
        let expected: [LampState] = [.on(.red), .on(.red), .on(.red), .on(.red)]
        #expect(result == expected)
    }
}
