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
            NavigationView {
            ScrumsView(scrums: DailyScrum.data)
            } // NAVIGATION
        } // WIDNOW
    } // BODY
}
