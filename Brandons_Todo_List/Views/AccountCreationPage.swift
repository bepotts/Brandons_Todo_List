//
//  AccountCreation.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/26/25.
//

import SwiftData
import SwiftUI
import os

struct AccountCreationPage: View {
    
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: UserSession
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
                let user = User(firstName: firstName, lastName: lastName, password: password,
                                passwordConfirmation: confirmPassword, email: email)
                do {
                    let isValid = try user.validateFields()
                    if isValid {
                        if (try saveUser(user: user)) != nil {
                            session.isLoggedIn = true
                            session.user = user
                            Logger.users.info("User Session created: \(user.firstName) \(user.lastName) (\(user.email))")
                        }
                    }
                } catch {
                    Logger.users.error("Error in user validation: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func saveUser(user: User) throws -> Bool? {
        context.insert(user)
        do {
            try context.save()
            Logger.users.info("User Saved: \(user.firstName) \(user.lastName) (\(user.email))")
            return true
        } catch {
            Logger.users.error("\(error.localizedDescription)")
        }
        return false
    }
}

#Preview {
    AccountCreationPage()
}
