//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 12/01/21.
//

import SwiftUI

struct DetailView: View {
    // MARK:- PROPERTIES
    @Binding var scrum: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var isPresented = false

    
    // MARK:- BODY
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                
                NavigationLink(destination: MeetingView()) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start Meeting"))
                } // NAVIGATION LINK
                
                HStack {
                    Label("Lenght", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))

                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                } // HSTACK
                
                HStack {
                  Label("Color", systemImage: "paintpalette")
                    
                  Spacer()
                    
                  Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(scrum.color)
                } // HSTACK
                
                .accessibilityElement(children: .ignore)
            } // SECTION 1
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            } // SECTION 2
        } // LIST
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
        .navigationBarItems(trailing: Button("Edit") {
            self.isPresented = true
            data = scrum.data
        })
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                .navigationTitle(scrum.title)
                .navigationBarItems(leading: Button("Cancel") {
                    self.isPresented = false
                }, trailing: Button("Done") {
                    self.isPresented = false
                    scrum.update(from: data)
                })
            }
        }
    } // BODY
}

// MARK:- PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
