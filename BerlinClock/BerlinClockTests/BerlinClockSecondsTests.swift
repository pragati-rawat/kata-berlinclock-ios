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
        #expect(result == "Y")
    }
}
