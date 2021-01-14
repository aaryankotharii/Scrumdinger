//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 19/12/20.
//

import SwiftUI

struct MeetingView: View {
    
    // BODY
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                } // VSTACK
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                } // VSTACK
            } // HSTACK
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time Remaining"))
            .accessibilityLabel(Text("10 minutes"))
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
        .padding()
    }
}

// PREVIEWS
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}

// END
