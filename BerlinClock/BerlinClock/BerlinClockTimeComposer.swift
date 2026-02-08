//
//  BerlinClockComposer.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

struct BerlinClockTimeComposer {
    let engine: BerlinClockEngine
    func composeClockTime(hours: Int, minutes: Int, seconds: Int) -> (seconds: LampState,
                                                                      topMins: [LampState],
                                                                      bottomMins: [LampState],
                                                                      topHours: [LampState],
                                                                      bottomHours: [LampState]) {
        let seconds = engine.secondsLamp(0)
        let topMin = engine.topMinuteRow(0)
        let bottomMin = engine.bottomMinuteRow(0)
        let topHour = engine.topHourRow(0)
        let bottomHour = engine.bottomHourRow(0)
        
        return (seconds, topMin, bottomMin, topHour, bottomHour)
        
    }
}
