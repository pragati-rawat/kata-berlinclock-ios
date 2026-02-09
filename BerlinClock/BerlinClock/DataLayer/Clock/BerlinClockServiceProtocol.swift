//
//  BerlinClockServiceProtocol.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//

protocol BerlinClockServiceProtocol {
    func now() -> BerlinDisplayClockTime
    func start(onTick: @escaping (BerlinDisplayClockTime) -> Void)
    func stop()
}
