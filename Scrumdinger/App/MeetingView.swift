//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 19/12/20.
//

import SwiftUI

struct MeetingView: View {
    // MARK:- PROPERTIES
    @Binding var scrum: DailyScrum
    // MARK:- BODY
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.color)
            
            VStack {

                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                } // HSTACK
            } // VSTACK
        } // ZSTACK
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

// PREVIEWS
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}

// END
