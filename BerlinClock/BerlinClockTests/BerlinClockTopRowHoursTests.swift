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
    
    @Test("Test top hour row is all off when hour is zero")
      func topHourRow_turnsOnOneLamp_forFiveHours() {
          let engine = BerlinClockEngine()

          let result = engine.topHourRow(5)
          let expected: [LampState] = [.on(.red), .off, .off, .off]
          #expect(result == expected)
      }
    
    @Test("Test top hour row is all off when hour is zero")
    func topHourRow_turnsOnTwoLamp_forFiveHours() {
        let engine = BerlinClockEngine()
        
        let result = engine.topHourRow(10)
        let expected: [LampState] = [.on(.red), .on(.red), .off, .off]
        #expect(result == expected)
    }
}
