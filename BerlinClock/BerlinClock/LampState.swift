//
//  LampState.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

enum LampState {
    case on
    case off
    
    var symbol: String {
        switch self {
        case .on:
            return "ON"
        case .off:
            return "OFF"
        }
    }
}
