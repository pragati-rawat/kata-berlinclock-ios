//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 09/02/2026.
//
import Foundation
import Combine

final class BerlinClockViewModel {
    
    private let clockService: BerlinClockServiceProtocol
    private let composer: BerlinClockTimeComposerProtocol
    
    @Published private(set) var composedTimeState: BerlinClockComposeTimeState?
    
    private var isStarted = false

    init(clockService: BerlinClockServiceProtocol, composer: BerlinClockTimeComposerProtocol) {
        self.clockService = clockService
        self.composer = composer
        self.composedTimeState = nil
    }
    
    func startEmittingTime() {
        guard !isStarted else { return }
        isStarted = true
        
        clockService.start { [weak self] time in
            guard let self else { return }
            self.composedTimeState = self.composer.composeClockTime(
                hours: time.hours,
                minutes: time.minutes,
                seconds: time.seconds
            )
        }
    }
}
