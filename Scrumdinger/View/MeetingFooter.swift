//
//  MeetingFooter.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 15/01/21.
//

import SwiftUI

struct MeetingFooter: View {
    // MARK:- PROPERTIES
    @Binding var speakers: [ScrumTimer.Speaker]
    
    var skipAction: () -> Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    private var isLastSpeaker : Bool {
        return speakers.dropLast().allSatisfy{ $0.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNo = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNo) of \(speakers.count)"
    }
    
    // MARK:- BODY
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: skipAction) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel(Text("Next speaker"))
                }
            }
        }
        .padding([.bottom,.horizontal])
    }
}

struct MeetingFooter_Previews: PreviewProvider{
    
    static var speakers = [ScrumTimer.Speaker(name: "Kim", isCompleted: false), ScrumTimer.Speaker(name: "Bill", isCompleted: false)]

    static var previews: some View {
        MeetingFooter(speakers: .constant(speakers), skipAction: {})
    }
}
