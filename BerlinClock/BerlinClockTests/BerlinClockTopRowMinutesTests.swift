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
    
    @Test("Test top minute row turns on one Lamp for five minutes")
    func topMinuteRow_turnsOnOneLamp_forFiveMinutes() {
        let engine = BerlinClockEngine()
        #expect(engine.topMinuteRow(5) == "YOOOOOOOOOO")
    }
    
    @Test("Test top minute row turns on one Lamp for ten minutes")
    func topMinuteRow_turnsOnTwoLamps_forTenMinutes() {
        let engine = BerlinClockEngine()
        #expect(engine.topMinuteRow(10) == "YYOOOOOOOOO")
    }
    
    @Test("Test top minute row turns on one Lamp for fifteen minutes")
      func topMinuteRow_marksQuarterHourLampRed_forFifteenMinutes() {
          let engine = BerlinClockEngine()
          #expect(engine.topMinuteRow(15) == "YYROOOOOOOO")
      }

    @Test("Test top minute row turns on lamps correctly for twenty minutes")
    func topMinuteRow_forTwentyMinutes() {
        let engine = BerlinClockEngine()
        #expect(engine.topMinuteRow(20) == "YYRYOOOOOOO")
    }

    @Test("Test top minute row turns on lamps correctly for thirty minutes")
    func topMinuteRow_forThirtyMinutes() {
        let engine = BerlinClockEngine()
        #expect(engine.topMinuteRow(30) == "YYRYYROOOOO")
    }

    @Test("Test top minute row turns on lamps correctly for thirty-five minutes")
    func topMinuteRow_forThirtyFiveMinutes() {
        let engine = BerlinClockEngine()
        #expect(engine.topMinuteRow(35) == "YYRYYRYOOOO")
    }

}
