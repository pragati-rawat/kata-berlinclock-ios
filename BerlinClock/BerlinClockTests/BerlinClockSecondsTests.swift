//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by Pragati RAWAT on 06/02/2026.
//

import Testing
@testable import BerlinClock

@Suite("BerlinClock Tests")

struct BerlinClockSecondsTests {
    
    @Test("Test seconds lamp is on when seconds is even")
    func secondsLamp_isOn_whenSecondsIsEven() {
        let engine = BerlinClockEngine()
        let result = engine.secondsLamp(0)
        #expect(result == "ON")
    }
    
    @Test("Test seconds lamp is off when second is odd")
    func secondsLamp_isOff_whenSecondsIsOdd() {
        let engine = BerlinClockEngine()
        let result = engine.secondsLamp(1)
        #expect(result == "OFF")
    }
    
    @Test("Test seconds lamp is on for any even seconds")
    func secondsLamp_isOn_forAnyEvenSecond() {
        let engine = BerlinClockEngine()
        
        #expect(engine.secondsLamp(2) == "ON")
        #expect(engine.secondsLamp(58) == "ON")
    }
    
    @Test("Test lamp is off for any odd seconds")
    func secondsLamp_isOff_forAnyOddSecond() {
        let engine = BerlinClockEngine()
        
        #expect(engine.secondsLamp(3) == "OFF")
        #expect(engine.secondsLamp(59) == "OFF")
    }
    
    @Test("Test seconds lamp turns on for any even seconds")
    func secondsLamp_turnsOn_forAnyEvenSecond() {
        let engine = BerlinClockEngine()

        for second in stride(from: 0, through: 58, by: 2) {
            #expect(engine.secondsLamp(second) == "ON")
        }
    }
    
    @Test("Test seconds lamp turns off for any odd seconds")
    func secondsLamp_turnsOff_forAnyOddSecond() {
        let engine = BerlinClockEngine()

        // Using through: 59 because it's the last odd second in a minute
        for second in stride(from: 1, through: 59, by: 2) {
            #expect(engine.secondsLamp(second) == "OFF")
        }
    }
}
