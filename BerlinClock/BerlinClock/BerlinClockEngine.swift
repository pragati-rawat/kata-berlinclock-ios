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
        if minutes >= 5 {
            return "YOOOOOOOOOO"
        }
        return "OOOOOOOOOOO"
    }
}
