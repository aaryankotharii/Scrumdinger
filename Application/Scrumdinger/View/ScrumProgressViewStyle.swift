//
//  ScrumProgressViewStyle.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 14/01/21.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    // MARK:- PROPERTIES
    let color: Color
    
    // MARK:- MAKE BODY
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(color.accessibleFontColor)
                .frame(height: 20.0)
            ProgressView(configuration)
                .frame(height: 12.0)
                .padding(.horizontal)
        } // ZSTACK
    } // BODY
}
