//
//  BerlinClockEngine.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

struct BerlinClockEngine {
    
    // MARK: Seconds Lamp State methods
    func secondsLamp(_ seconds: Int) -> LampState {
        let state: LampState = seconds.isMultiple(of: 2) ? .on(.yellow) : .off
        return state
    }
    
    //MARK: Minutes Lamps state methods
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
    
    //MARK: Hours Lamps state methods
    func topHourRow(_ hours: Int) -> [LampState] {
        let onCount = hours / 5
        return (0..<4).map { index in
            index < onCount ? .on(.red) : .off
        }
    }
    
    func bottomHourRow(_ hours: Int) -> [LampState] {
        return [.off, .off, .off, .off]
    }
}

