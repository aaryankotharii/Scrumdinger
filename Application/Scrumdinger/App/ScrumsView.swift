//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 12/01/21.
//

import SwiftUI

struct ScrumsView: View {
    // MARK:- PROPERTIES
    @Binding var scrums: [DailyScrum]
    @State private var isPresented = false
    @State private var newScrumData = DailyScrum.Data()
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    // MARK:- BODY
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            } // FOREACH
        } // LIST
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: presentEditView, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $newScrumData)
                    .navigationBarItems(leading: Button("Dismiss", action: dismissEditView), trailing: Button("Add", action: addScrum))
            }
        }
        .onChange(of: scenePhase){ phase in
            if phase == .inactive { saveAction() }
        }
    } // BODY
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Can't find scrum in array")
        }
        return $scrums[scrumIndex]
    }
    
    private func presentEditView() {
        self.isPresented = true
    }
    
        private func dismissEditView() {
            self.isPresented = false
        }
    
    private func addScrum() {
        self.isPresented = false
        let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
        self.scrums.append(newScrum)
    }
}

// MARK:- PREVIEWS
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data), saveAction: {})
        }
    }
}
