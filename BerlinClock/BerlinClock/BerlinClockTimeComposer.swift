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
        let seconds = engine.secondsLamp(seconds)
        let topMin = engine.topMinuteRow(minutes)
        let bottomMin = engine.bottomMinuteRow(minutes)
        let topHour = engine.topHourRow(hours)
        let bottomHour = engine.bottomHourRow(hours)
        
        return (seconds, topMin, bottomMin, topHour, bottomHour)
        
    }
}
