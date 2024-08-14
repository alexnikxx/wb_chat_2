//
//  ContactsView.swift
//  wb_chat_2
//
//  Created by Tatiana Lazarenko on 8/10/24.
//

import SwiftUI
import UISystem

struct ContactsView: View {
    //@EnvironmentObject var router: Router
    @State private var inputText = ""
    
    let contacts: Contacts
    
    var filteredContacts: [Contact] {
        inputText.isEmpty ? contacts.contacts : contacts.contacts.filter { $0.fullname.lowercased().contains(inputText.lowercased())
        }
    }
    
    init() {
    self.contacts = Contacts()
    }
    
    var body: some View {
        VStack {
            WBNavigationBar(title: LocalizedStrings.contacts, isBackButton: false, rightButtonIcon: "plus") {
                //router.navigateTo(CreateContactView)
            }
            
            WBSearchBarView(inputText: $inputText)
                .padding(.horizontal, 24)
                .padding(.top, 16)
            
            List(filteredContacts, id: \.self) { contact in
                ContactRowView(contact: contact)
                    .listRowBackground(Color("background"))
                    .listRowSeparatorTint(Color("textfield"))
                    .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                    .alignmentGuide(.listRowSeparatorTrailing) { separator in
                        separator.width - 2
                    }
                    .padding(5)
                    .onTapGesture {
                        //router.navigateTo(ContactDetailView)
                    }
            }
            .listStyle(.plain)
            
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color("background"))
        .onTapGesture {
            hideKeyboard()
        }
    }
}

