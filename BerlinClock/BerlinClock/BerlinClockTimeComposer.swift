//
//  BerlinClockComposer.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

struct BerlinClockTimeComposer {
    let berlinClockEngine: BerlinClockEngine
    func composeClockTime(hours: Int, minutes: Int, seconds: Int) -> (seconds: LampState,
                                                             topMins: [LampState],
                                                             bottomMins: [LampState],
                                                             topHours: [LampState],
                                                             bottomHours: [LampState]) {
        let seconds = berlinClockEngine.secondsLamp(0)
        let topMin = berlinClockEngine.topMinuteRow(0)
        let bottomMin = berlinClockEngine.bottomMinuteRow(0)
        let topHour = berlinClockEngine.topHourRow(0)
        let bottomHour = berlinClockEngine.bottomHourRow(0)

        return (seconds, topMin, bottomMin, topHour, bottomHour)
        
    }
}
