//
//  MeetingHeader.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 14/01/21.
//

import SwiftUI

struct MeetingHeader: View {
    // MARK:- BODY
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
        } // VSTACK
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time Remaining"))
        .accessibilityLabel(Text("10 minutes"))
    } // BODY
}

// MARK:- PREVIEWS
struct MeetingHeader_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeader()
            .previewLayout(.sizeThatFits)
    }
}
