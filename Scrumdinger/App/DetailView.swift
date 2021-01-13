//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 12/01/21.
//

import SwiftUI

struct DetailView: View {
    // MARK:- PROPERTIES
    let scrum: DailyScrum
    
    // MARK:- BODY
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                
                NavigationLink(destination: MeetingView()) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start Meeting"))
                }
                
                HStack {
                    Label("Lenght", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))

                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
                HStack {
                  Label("Color", systemImage: "paintpalette")
                    
                  Spacer()
                    
                  Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
    }
}

// MARK:- PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        DetailView(scrum: DailyScrum.data[0])
        }
    }
}
