//
//  ContentView.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI
import ContactsUI

struct ContentView: View {
    @State var isPresent: Bool = false
    @State var showAlert = false
    @State private var searchText = ""
    let contactData: [ContactData] = Bundle.main.decode("data.json")
    @ObservedObject var jsonProvider: JSONProvider = JSONProvider()
    var body: some View {
        NavigationView {
            ZStack{
                ZStack {
                    List {
                        ForEach(matchingContacts) { contact in
                            NavigationLink(destination: DetailsView(contactsData: contact)){
                                ContactListItem(contactsData: contact)
                            }
                        }
                    }
                    .searchable( text: $searchText, prompt: "find contacts")
                    .listStyle(PlainListStyle())
                    .refreshable {
                        
                    }
                }
                .navigationBarItems(leading:
                                        Button (action: {
                }) {Image(systemName: "magnifyingglass").foregroundColor(AppColors.primary)}
                                    , trailing: Button (action: {
                    withAnimation(.easeIn(duration: 1)){
                        self.showAlert.toggle()
                    }
                }) {Image(systemName: "plus").foregroundColor(AppColors.primary)}
                )
                .blur(radius: showAlert ? 30: 0)
                .navigationBarTitle("Contacts")
                .navigationBarTitleDisplayMode(.inline)
                
                if showAlert {
                    AddContactView(showAlert: $showAlert)
                }
            }
        }
    }
    var matchingContacts: [ContactData] {
        if searchText.isEmpty {
            return contactData
        } else {
            return contactData.filter { $0.firstName.contains( searchText )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
