//
//  AddContactView.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI

struct AddContactView: View {
    
    @Binding var showAlert: Bool
    @State public var firstName: String = ""
    @State public var lastName: String = ""
    @State public var emailAdd: String = ""
    @State public var phoneNum: String = ""
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(AppColors.primary)
                .frame(width: 80, height: 80)
            HStack {
                Text("Main Information")
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            .background(AppColors.lightgray)
            .cornerRadius(6)
            HStack {
                Text("Fisrt Name")
                Spacer()
                TextField("", text: $firstName)
                    .padding()
                    .frame(width: 120, height: 20)
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
                    .frame(width: 120, height: 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            HStack {
                Text("Sub Information")
                    .fontWeight(.semibold)
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
                    .frame(width: 120, height: 20)
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
                    .frame(width: 120, height: 20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                Spacer()
            }
            Spacer()
            Button("Okay",   action: {
                withAnimation(.spring()){
                    showAlert.toggle()
                }
            })
            .foregroundColor(AppColors.white)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.5, height: 400)
        .background(AppColors.primary.opacity(0.7))
        .cornerRadius(20)
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(showAlert: .constant(false))
    }
}
