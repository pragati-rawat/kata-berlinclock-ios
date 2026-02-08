//
//  BerlinClockServiceTests.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 08/02/2026.
//

import Testing
import Foundation
@testable import BerlinClock

@Suite("ClockService Tests")
struct ClockServiceTests {

    @Test("Test Clock Service to generate correct snapshot of hours mins seconds")
    func clockTime_extractsHoursMinutesSeconds_fromGivenDate() {
        // 1970-01-01 01:01:01 UTC
        let date = Date(timeIntervalSince1970: 3661)

        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!

        let service = ClockService(calendar: calendar)

        let time = service.clockTime(from: date)

        #expect(time.hours == 1)
        #expect(time.minutes == 1)
        #expect(time.seconds == 1)
    }

    @Test("Test now() to return current clock time")
    func now_returnsClockTime() {
        let service = ClockService()
        let time = service.now()

        #expect(time.hours >= 0)
        #expect(time.minutes >= 0)
        #expect(time.seconds >= 0)
    }
    
    @Test("Test start/stop to not crash")
    func start_thenStop_doesNotCrash() {
        let service = ClockService()

        service.start { _ in }
        service.stop()

        #expect(true)
    }
}
