//
//  LampState.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

enum LampColor {
    case yellow
    case red
}

enum LampState: Equatable, Sendable {
    case on(LampColor)
    case off
}
