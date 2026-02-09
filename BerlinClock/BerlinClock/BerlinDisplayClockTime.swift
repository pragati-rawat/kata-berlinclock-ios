//
//  BerlinDisplayClockTime.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//
import Foundation

struct BerlinDisplayClockTime: Equatable {
    let hours: Int
    let minutes: Int
    let seconds: Int
}

extension BerlinDisplayClockTime {
    var digitalText: String {
        String(
            format: "%02d:%02d:%02d",
            hours,
            minutes,
            seconds
        )
    }
}
