//
//  BerlinClockEngine.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

struct BerlinClockEngine {
    
    // MARK: Seconds Lamp State Logic
    func secondsLamp(_ seconds: Int) -> LampState {
        let state: LampState = seconds.isMultiple(of: 2) ? .on : .off
        return state
    }
    
    func topMinuteRow(_ minutes: Int) -> String {
        let onCount = minutes / 5
        let on = String(repeating: "Y", count: onCount)
        let off = String(repeating: "O", count: 11 - onCount)
        return on + off
    }
}
