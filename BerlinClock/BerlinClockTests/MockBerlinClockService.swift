//
//  MockBerlinClockService.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import Testing
import Foundation
@testable import BerlinClock

final class MockBerlinClockService: BerlinClockServiceProtocol {
    var stubbedTime = BerlinDisplayClockTime(hours: 0, minutes: 0, seconds: 0)
    private var onTickClosure: ((BerlinDisplayClockTime) -> Void)?

    func now() -> BerlinDisplayClockTime {
        stubbedTime
    }

    func start(onTick: @escaping (BerlinDisplayClockTime) -> Void) {
        self.onTickClosure = onTick
    }

    func stop() {
        onTickClosure = nil
    }

    // Test helper
    func simulateTick(at time: BerlinDisplayClockTime) {
        stubbedTime = time
        onTickClosure?(time)
    }
}
