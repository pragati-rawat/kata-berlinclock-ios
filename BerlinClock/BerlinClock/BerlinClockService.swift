//
//  BerlinClockService.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//
import Foundation

final class ClockService {
    private let calendar: Calendar
    private var timer: Timer?
    
    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }
    
    func clockTime(from date: Date) -> BerlinDisplayClockTime {
        let components = calendar.dateComponents(
            [.hour, .minute, .second],
            from: date
        )
        
        return BerlinDisplayClockTime (
            hours: components.hour ?? 0,
            minutes: components.minute ?? 0,
            seconds: components.second ?? 0
        )
    }
    
    func now() -> BerlinDisplayClockTime {
        clockTime(from: Date())
    }
}

extension ClockService {
    func start(onTick: @escaping (BerlinDisplayClockTime) -> Void) {
        stop()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true
        ) { [weak self] _ in
            guard let self else { return }
            onTick(self.now())
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
