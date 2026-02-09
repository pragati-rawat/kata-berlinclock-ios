//
//  BerlinClockTimeComposerProtocol.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

protocol BerlinClockTimeComposerProtocol {
    func composeClockTime(hours: Int, minutes: Int, seconds: Int) -> BerlinClockComposeTimeState
}
