//
//  AccountCreation.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/26/25.
//

import SwiftUI

struct AccountCreationPage: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Text("Create an Account")
            TextField("First Name", text: $firstName).roundedTextView()
            TextField("Last Name", text: $lastName).roundedTextView()
            TextField("Email", text: $email).roundedTextView()
            SecureField("Password", text: $password).roundedTextView()
            SecureField("Confirm Password", text: $confirmPassword).roundedTextView()
            Button("Create Account") {
                print("Account Submitted")
            }
        }
    }
}

#Preview {
    AccountCreationPage()
}
