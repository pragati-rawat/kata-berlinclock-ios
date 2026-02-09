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
        return fillLampFromLeft(lampCount: 11, onCount: onCount) { index in
            let color: LampColor = (index + 1).isMultiple(of: 3) ? .red : .yellow
            return .on(color)
        }
    }
    
    func bottomMinuteRow(_ minutes: Int) -> [LampState] {
        let onCount = minutes % 5
        return fillLampFromLeft(lampCount: 4, onCount: onCount) { _ in
                .on(.yellow)
        }
    }
    
    //MARK: Hours Lamps state methods
    func topHourRow(_ hours: Int) -> [LampState] {
        let onCount = min(hours / 5, 4)
        return fillLampFromLeft(lampCount: 4, onCount: onCount) { _ in
                .on(.red)
        }
    }
    
    func bottomHourRow(_ hours: Int) -> [LampState] {
        let onCount = hours % 5
        return fillLampFromLeft(lampCount: 4, onCount: onCount) { _ in
                .on(.red)
        }
    }
}

// MARK: Helper Functions
extension BerlinClockEngine {
    private func fillLampFromLeft(lampCount: Int,
                                  onCount: Int,
                                  onLampAt onLamp: (Int) -> LampState) -> [LampState] {
        (0..<lampCount).map { index in
            index < onCount ? onLamp(index) : .off
        }
    }
}

