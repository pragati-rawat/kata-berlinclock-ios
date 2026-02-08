//
//  BerlinClockComposer.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

struct BerlinClockTimeComposer : BerlinClockTimeComposerProtocol {
    private let engine: BerlinClockEngine

    init(engine: BerlinClockEngine = BerlinClockEngine()) {
        self.engine = engine
    }
    
    func composeClockTime(hours: Int, minutes: Int, seconds: Int) -> BerlinClockComposeTimeState {
        let seconds = engine.secondsLamp(seconds)
        let topMin = engine.topMinuteRow(minutes)
        let bottomMin = engine.bottomMinuteRow(minutes)
        let topHour = engine.topHourRow(hours)
        let bottomHour = engine.bottomHourRow(hours)
        
        return BerlinClockComposeTimeState(seconds: seconds,
                                           topMins: topMin,
                                           bottomMins: bottomMin,
                                           topHours: topHour,
                                           bottomHours: bottomHour)
    }
}
