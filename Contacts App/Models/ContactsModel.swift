//
//  ContactsModel.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI
struct ContactData: Codable, Identifiable {
    
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
}
