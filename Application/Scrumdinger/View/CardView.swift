//
//  CardView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 12/01/21.
//

import SwiftUI

struct CardView: View {
    // MARK:- PROPERTIES
    let scrum: DailyScrum
    
    // MARK:- BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityLabel(Text("\(scrum.attendees.count)"))

                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting Lenght"))
                    .accessibilityLabel(Text("\(scrum.lengthInMinutes) minutes"))

            } // HSTACK
            .font(.caption)
        } // VSTACK
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    } // BODY
}

// MARK:- PREVIEWS
struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
