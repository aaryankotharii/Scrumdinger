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
    @ObservedObject var data = ScrumData()
    
    // MARK:- BODY
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums, saveAction: data.save)
            } // NAVIGATION
            .onAppear(perform: data.load)
        } // WIDNOW
    } // BODY
}
