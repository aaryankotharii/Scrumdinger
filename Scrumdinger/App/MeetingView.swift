//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 19/12/20.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    // MARK:- PROPERTIES
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    var player: AVPlayer = { AVPlayer.sharedDingPlayer }()
    
    // MARK:- BODY
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.color)
            
            VStack {

                MeetingHeader(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining, scrumColor: scrum.color)
                
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                MeetingFooter(speakers: $scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            } // VSTACK
        } // ZSTACK
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear(perform: start)
        .onDisappear(perform: scrumTimer.stopScrum)
    }
    
    func start() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.startScrum()
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
    }
    
    
}

// PREVIEWS
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}

// END
