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
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            } // FOREACH
        } // LIST
    } // BODY
}

// MARK:- PREVIEWS
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
