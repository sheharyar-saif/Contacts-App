//
//  ContactsModel.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI
struct ContactData: Codable, Identifiable {
    
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
}

