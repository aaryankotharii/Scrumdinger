//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 16/01/21.
//

import SwiftUI

struct MeetingTimerView: View {
    // MARK:- PROPERTIES
    @Binding var speakers: [ScrumTimer.Speaker]
    var scrumColor: Color
    private var currentSpeaker: String { speakers.first(where: { !$0.isCompleted })?.name ?? "Someone" }

    // MARK:- BODY
    var body: some View {
        ZStack {
        Circle()
            .strokeBorder(lineWidth: 24, antialiased: true)
            VStack {
                Text(currentSpeaker)
                    .font(.title)
                Text("is speaking")
            } // VSTACK
            .foregroundColor(scrumColor.accessibleFontColor)
        } // ZSTACK
        .padding(.horizontal)
    } // BODY
}

// MARK:- PREVIEW
struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [ScrumTimer.Speaker(name: "Kim", isCompleted: true), ScrumTimer.Speaker(name: "Bill", isCompleted: false)]
    static var previews: some View {
        MeetingTimerView(speakers: $speakers, scrumColor: Color("Design"))
    }
}
