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
    
    init(clockService: BerlinClockServiceProtocol, composer: BerlinClockTimeComposerProtocol) {
        self.clockService = clockService
        self.composer = composer
        self.composedTimeState = nil
    }
}
