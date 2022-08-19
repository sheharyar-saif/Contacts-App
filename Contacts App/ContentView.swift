//
//  ContentView.swift
//  Contacts App
//
//  Created by Sheharyar Saif on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    let contactData: [ContactData] = Bundle.main.decode("data.json")
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 18) {
                    ForEach(contactData) { item in
                        ContactListItem(contactsData: item)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
