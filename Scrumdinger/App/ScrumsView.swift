//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 12/01/21.
//

import SwiftUI

struct ScrumsView: View {
    // MARK:- PROPERTIES
    @Binding var scrums: [DailyScrum]
    
    // MARK:- BODY
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
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
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Can't find scrum in array")
        }
        return $scrums[scrumIndex]
    }
    
}

// MARK:- PREVIEWS
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
