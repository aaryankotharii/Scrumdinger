//
//  MeetingHeader.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 14/01/21.
//

import SwiftUI

struct MeetingHeader: View {
    // MARK:- PROPERTIES
    @Binding var secondsElapsed: Int
    @Binding var secondsRemaining: Int
    
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1}
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    
    private var minutesRemaining: Int {
        return secondsRemaining/60
    }
    
    private var minutesRemainingMetric: String {
        return minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    let scrumColor : Color
    
    // MARK:- BODY
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(color: scrumColor))
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                } // VSTACK
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    
                    HStack {
                        Text("\(secondsRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    } // HSTACK
                } // VSTACK
            } // HSTACK
        } // VSTACK
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time Remaining"))
        .accessibilityLabel(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
        .padding([.top,.horizontal])
    } // BODY
}

// MARK:- PREVIEWS
struct MeetingHeader_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeader(secondsElapsed: .constant(300), secondsRemaining: .constant(150), scrumColor: .random)
            .previewLayout(.sizeThatFits)
    }
}
