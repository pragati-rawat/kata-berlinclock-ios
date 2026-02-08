//
//  BerlinClockTimeState.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

struct BerlinClockComposeTimeState: Equatable {
    let seconds: LampState
    let topMins: [LampState]
    let bottomMins: [LampState]
    let topHours: [LampState]
    let bottomHours: [LampState]
    
}
