//
//  DetailsView.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    //    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var jsonProvider: JSONProvider = JSONProvider()
    
    let contactsData: ContactData
    
    @State public var firstName: String = ""
    @State public var lastName: String = ""
    @State public var emailAdd: String = ""
    @State public var phoneNum: String = ""
    
    var body: some View {
        VStack{
            Circle()
                .foregroundColor(AppColors.primary)
                .frame(width: 160, height: 160)
            HStack {
                Text("Main Information")
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .background(AppColors.lightgray)
            .cornerRadius(10)
            HStack {
                Text("Fisrt Name")
                Spacer()
                TextField("", text: $firstName)
                    .padding()
                    .frame(width: 260, height: 40)
                    .onAppear {
                        self.firstName = contactsData.firstName
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            HStack {
                Text("Last Name")
                Spacer()
                TextField("", text: $lastName)
                    .padding()
                    .frame(width: 260, height: 40)
                    .onAppear {
                        self.lastName = contactsData.lastName
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            HStack {
                Text("Sub Information")
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .background(AppColors.lightgray)
            .cornerRadius(10)
            HStack {
                Text("Email")
                Spacer()
                TextField("Optional", text: $emailAdd)
                    .padding()
                    .frame(width: 260, height: 40)
                    .onAppear {
                        self.emailAdd = contactsData.email
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            HStack {
                Text("Phone")
                Spacer()
                TextField("Optional", text: $phoneNum)
                    .padding()
                    .frame(width: 260, height: 40)
                    .onAppear {
                        self.phoneNum = contactsData.phone
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            Text(jsonProvider.contactsData.firstName)
                .padding()
            Spacer()
        }
        .onAppear {
            jsonProvider.getData()
        }
        .padding()
        .navigationBarItems(leading: Button ("Cancel", action: {
            presentationMode.wrappedValue.dismiss()
        }).foregroundColor(AppColors.primary),trailing: Button ("Save",action:{
            jsonProvider.contactsData.firstName = firstName
            jsonProvider.writeToFile()
            presentationMode.wrappedValue.dismiss()
        }).foregroundColor(AppColors.primary)
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static let contact: [ContactData] = Bundle.main.decode("data.json")
    static var previews: some View {
        DetailsView(contactsData: contact[0])
    }
}
