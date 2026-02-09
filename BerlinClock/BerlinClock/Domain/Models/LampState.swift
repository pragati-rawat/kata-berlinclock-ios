//
//  LampState.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

enum LampState: Equatable, Sendable {
    case on(LampColor)
    case off
}

extension LampState {
    var isOn: Bool {
        if case .on = self { return true }
        return false
    }

    var lampColor: LampColor? {
        if case let .on(color) = self { return color }
        return nil
    }
}
