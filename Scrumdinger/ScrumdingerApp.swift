//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 19/12/20.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    // MARK:- PROPERTIES
    @State private var scrums = DailyScrum.data
    
    // MARK:- BODY
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ScrumsView(scrums: $scrums)
            } // NAVIGATION
        } // WIDNOW
    } // BODY
}
