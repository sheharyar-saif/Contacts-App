//
//  ContactListItem.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI

struct ContactListItem: View {
    let contactsData : ContactData
    var body: some View {
        HStack(spacing: 16){
            Circle()
                .foregroundColor(AppColors.primary)
                .frame(width: 60, height: 60, alignment: .center)
            
            Text(contactsData.firstName + " " + contactsData.lastName)
                .foregroundColor(AppColors.black)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 70)
    }
}

struct ContactListItem_Previews: PreviewProvider {
    static let contact: [ContactData] = Bundle.main.decode("data.json")
    
    static var previews: some View {
        ContactListItem(contactsData: contact[0])
            .previewLayout(.sizeThatFits)
    }
}
