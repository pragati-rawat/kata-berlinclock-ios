//
//  BerlinClockTopMinutesTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 07/02/2026.
//
import Testing
@testable import BerlinClock

@Suite("BerlinClockTopRowMinutes Tests")
struct BerlinClockTopRowMinutesTests {
    
    @Test("Verify top minute row states", arguments: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55])
    func topMinuteRow_matchesExpectedLampStates(minutes: Int) {
        let engine = BerlinClockEngine()
        
        let expected = expectedTopMinuteRow(for: minutes)
        let actual = engine.topMinuteRow(minutes)
        
        #expect(actual == expected)
    }
}

// MARK: Helper function for test case
extension BerlinClockTopRowMinutesTests {
    
    func expectedTopMinuteRow(for minutes: Int) -> [LampState] {
        let onCount = minutes / 5
        return (1...11).map { index in
            if index <= onCount {
                // Every 3rd lamp (3, 6, 9) is Red, others are Yellow
                let color: LampColor = (index % 3 == 0) ? .red : .yellow
                return .on(color)
            } else {
                return .off
            }
        }
    }
}
