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
    @Published private(set) var digitalTimeText: String = ""

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
            self?.handleTick(time)
        }
    }

    func stop() {
        guard isStarted else { return }
        isStarted = false
        clockService.stop()
    }

    // MARK: - Tick handling
    private func handleTick(_ time: BerlinDisplayClockTime) {
        composedTimeState = composer.composeClockTime(
            hours: time.hours,
            minutes: time.minutes,
            seconds: time.seconds
        )
        
        digitalTimeText = formatDigitalTime(from: time)
    }
    
    private func formatDigitalTime(from time: BerlinDisplayClockTime) -> String {
        String(
            format: "%02d:%02d:%02d",
            time.hours,
            time.minutes,
            time.seconds
        )
    }
}
