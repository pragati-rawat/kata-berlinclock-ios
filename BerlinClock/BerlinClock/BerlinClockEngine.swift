//
//  BerlinClockEngine.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

struct BerlinClockEngine {
    
    // MARK: Seconds Lamp State Logic
    func secondsLamp(_ seconds: Int) -> LampState {
        let state: LampState = seconds.isMultiple(of: 2) ? .on(.yellow) : .off
        return state
    }
    
    func topMinuteRow(_ minutes: Int) -> [LampState] {
        let onCount = minutes / 5
        
        return (0..<11).map { index in
            guard index < onCount else {
                return .off
            }
            
            let color: LampColor =
            (index + 1).isMultiple(of: 3) ? .red : .yellow
            
            return .on(color)
        }
    }
    
    func bottomMinuteRow(_ minutes: Int) -> [LampState] {
        let onCount = minutes % 5
        return (0..<4).map { index in
            index < onCount ? .on(.yellow) : .off
        }
    }
    
    func topHourRow(_ hours: Int) -> [LampState] {
        switch hours {
        case 5: return [.on(.red), .off, .off, .off]
        case 10: return [.on(.red), .on(.red), .off, .off]
        case 15: return [.on(.red), .on(.red), .on(.red), .off]
        case 20: return [.on(.red), .on(.red), .on(.red), .on(.red)]
        default:
            return [.off, .off, .off, .off]
        }
    }
}

