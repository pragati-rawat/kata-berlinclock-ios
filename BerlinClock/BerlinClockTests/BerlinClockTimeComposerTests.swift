//
//  BerlinClockComposerTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

import Testing
@testable import BerlinClock

@Suite("BerlinClockComposer Tests")
@MainActor
struct BerlinClockTimeComposerTests {
    
    @Test("Test composing BerlinClock state")
    func compose_returnsBerlinClockState() {
        let engine = BerlinClockEngine()
        let composer = BerlinClockTimeComposer(engine: engine)
        
        let state = composer.composeClockTime(hours: 0, minutes: 0, seconds: 0)
        
        // seconds lamp should be a single LampState (no count)
        #expect(state.seconds == .on(.yellow))
        // top minutes row has 11 lamps
        #expect(state.1.count == 11)
        // bottom minutes row has 4 lamps
        #expect(state.2.count == 4)
        // top hours row has 4 lamps
        #expect(state.3.count == 4)
        // bottom hours row has 4 lamps
        #expect(state.4.count == 4)
    }
    
    @Test("Test seconds lamp is provided by the engine")
    func compose_usesEngineForSeconds() {
        let engine = BerlinClockEngine()
        let composer = BerlinClockTimeComposer(engine: engine)

        let state = composer.composeClockTime(
            hours: 0,
            minutes: 0,
            seconds: 2
        )
        #expect(state.seconds == .on(.yellow))
    }
    
    @Test("Test minutes lamps are provided by the engine")
    func compose_usesEngineForMinutes() {
        let engine = BerlinClockEngine()
        let composer = BerlinClockTimeComposer(engine: engine)

        let state = composer.composeClockTime(
            hours: 0,
            minutes: 6,
            seconds: 0
        )
        #expect(state.topMins == [.on(.yellow), .off, .off, .off, .off, .off, .off, .off, .off, .off, .off])
        #expect(state.bottomMins == [.on(.yellow), .off, .off, .off])
    }
    
    @Test("Test seconds lamp is provided by the engine")
    func compose_usesEngineForHours() {
        let engine = BerlinClockEngine()
        let composer = BerlinClockTimeComposer(engine: engine)
        
        let state = composer.composeClockTime(
            hours: 13,
            minutes: 0,
            seconds: 0
        )
        
        #expect(state.topHours == [.on(.red), .on(.red), .off, .off])
        #expect(state.bottomHours == [.on(.red), .on(.red), .on(.red), .off])
    }
}

