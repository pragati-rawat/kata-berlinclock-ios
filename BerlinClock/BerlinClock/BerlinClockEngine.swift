//
//  BerlinClockEngine.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

struct BerlinClockEngine {
    func secondsLamp(_ seconds: Int) -> String {
        if seconds % 2 == 0 {
            return "On"
        } else {
            return "OFF"
        }
    }
}
