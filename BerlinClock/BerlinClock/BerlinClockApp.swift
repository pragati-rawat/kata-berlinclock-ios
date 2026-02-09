//
//  BerlinClockApp.swift
//  BerlinClock
//
//  Created by Pragati RAWAT on 06/02/2026.
//

import SwiftUI

@main
struct BerlinClockApp: App {
    var body: some Scene {
        WindowGroup {
            BerlinClockScreenView(
                viewModel: makeBerlinClockViewModel()
            )
        }
    }

    // MARK: - Dependency assembly
    private func makeBerlinClockViewModel() -> BerlinClockViewModel {
        let clockService = BerlinClockService()
        let composer = BerlinClockTimeComposer()

        return BerlinClockViewModel(
            clockService: clockService,
            composer: composer
        )
    }
}
