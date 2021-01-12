//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 19/12/20.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
