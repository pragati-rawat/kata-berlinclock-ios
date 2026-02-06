//
//  BerlinClockEngine.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

struct BerlinClockEngine {
    func secondsLamp(_ seconds: Int) -> String {
        let state: LampState = seconds.isMultiple(of: 2) ? .on : .off
        return state.symbol
    }
}
