//
//  EditView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 13/01/21.
//

import SwiftUI

struct EditView: View {
    @Binding var scrumData: DailyScrum.Data
    @State private var newAttendee: String = ""
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
                
                HStack {
                    Slider(value: $scrumData.lengthInMinutes) {
                        Text("Lenght")
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))

                    Spacer()
                    
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }

                
                ColorPicker("Color", selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
                .onDelete { indexSet in
                    scrumData.attendees.remove(atOffsets: indexSet)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    
                    Button(action: addAttendee) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    func addAttendee(){
        withAnimation {
            scrumData.attendees.append(newAttendee)
            newAttendee = ""
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(scrumData: .constant(DailyScrum.data[0].data))
    }
}
