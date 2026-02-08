//
//  BerlinClockService.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//
import Foundation

struct ClockService {
    private let calendar: Calendar
    
    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }
    
    func clockTime(from date: Date) -> (hours: Int, minutes: Int, seconds: Int) {
        let components = calendar.dateComponents(
            [.hour, .minute, .second],
            from: date
        )
        
        return (
            hours: components.hour ?? 0,
            minutes: components.minute ?? 0,
            seconds: components.second ?? 0
        )
    }
    
    func now() -> (hours: Int, minutes: Int, seconds: Int) {
        clockTime(from: Date())
    }

}
