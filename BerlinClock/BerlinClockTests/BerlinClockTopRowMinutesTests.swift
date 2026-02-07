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

    @Test("Test top minute row is all of when minute is zero")
    func topMinuteRow_isAllOff_whenMinutesIsZero() {
        let engine = BerlinClockEngine()
        let result = engine.topMinuteRow(0)
        #expect(result == "OOOOOOOOOOO") // 11 OFF lamps
    }
}
