//
//  JSONProvider.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import Foundation

class JSONProvider: ObservableObject {
    
    @Published var contactsData: ContactData = ContactData(id: " ", firstName: " ", lastName: " ", email: " ", phone: " ")
    private var fm = FileManager.default
    private let mainUrl: URL = Bundle.main.url(forResource: "data", withExtension: "json")!
    
    func getData() {
        if fm.fileExists(atPath: documentDirectoryJSONURL().path) {
            decodeData(fromURL: documentDirectoryJSONURL())
        } else {
            decodeData(fromURL: mainUrl)
        }
    }
    
    func documentDirectoryJSONURL() -> URL {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            return documentDirectory.appendingPathComponent("data.json")
        } catch {
            fatalError("Couldn't create URL")
        }
    }
    
    func decodeData(fromURL url: URL){
        do{
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let contData = try decoder.decode(ContactData.self, from: jsonData)
            self.contactsData = contData
        } catch {
            print(error)
//            assertionFailure("Error decoding JSON")
        }
    }
    
    func writeToFile() {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(contactsData)
            try jsonData.write(to: documentDirectoryJSONURL())
        } catch {
            print(error)
        }
    }
}
