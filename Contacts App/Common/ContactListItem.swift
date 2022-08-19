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
        HStack(spacing: 12) {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(contactsData.firstName)
                    .foregroundColor(.black)
//                Text(contactsData.headline)
//                    .font(.custom(CommonFont.MontserratFontStyle.light.name, size: 10))
//                    .foregroundColor(AppColors.gray)
            }
            Spacer()
        }
        .padding()
//        .overlay(
//            RoundedRectangle(cornerRadius: 12.0)
//                .stroke(AppColors.primary, lineWidth: 1))
    }
}

struct ContactListItem_Previews: PreviewProvider {
    static let contact: [ContactData] = Bundle.main.decode("data.json")
    
    static var previews: some View {
        ContactListItem(contactsData: contact[0])
    }
}
