//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 12/01/21.
//

import SwiftUI

struct ScrumsView: View {
    // MARK:- PROPERTIES
    let scrums: [DailyScrum]
    
    // MARK:- BODY
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            } // FOREACH
        } // LIST
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}, label: {
            Image(systemName: "plus")
        }))
    } // BODY
}

// MARK:- PREVIEWS
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ScrumsView(scrums: DailyScrum.data)
        }
    }
}
