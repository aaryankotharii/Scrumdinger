//
//  ScrumData.swift
//  Scrumdinger
//
//  Created by Aaryan Kothari on 16/01/21.
//

import Foundation

class ScrumData: ObservableObject {
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Cany find documents directory")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("scrums.data")
    }
    
    @Published var scrums: [DailyScrum] = []
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.data
                }
                #endif
                return
            }
            
            guard let dailyScrums = try? JSONDecoder().decode([DailyScrum].self, from: data) else {
                fatalError("Cant decode saved scrum data")
            }
            
            DispatchQueue.main.async {
                self?.scrums = dailyScrums
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let scrums = self?.scrums else { fatalError("self out of scope") }
            guard let data = try? JSONEncoder().encode(scrums) else { fatalError("Error encoding data") }
            
            do {
                let outFile = Self.fileURL
                try data.write(to: outFile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
