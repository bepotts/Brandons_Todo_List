//
//  User.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/26/25.
//

import Foundation
import SwiftData

@Model
class User: CustomStringConvertible {
    @Attribute(.unique) var id: UUID
    
    /// User's First Name
    var firstName: String
    /// User's Last Name
    var lastName: String
    /// User's Password. Must match field "passwordConfirmation" or validation will not pass
    var password: String
    /// Used as a confirmation for User's password. Must match field "password" or validation will not pass
    var passwordConfirmation: String
    /// User's email address
    var email: String
    
    var description: String {
        "firstName:(\(firstName)),lastName:(\(lastName)), email:(\(email))"
    }
    
    init(firstName: String, lastName: String, password: String, passwordConfirmation: String, email: String) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.passwordConfirmation = passwordConfirmation
        self.email = email
    }
    
    func validateFields() throws -> Bool {
        if firstName.isEmpty || lastName.isEmpty || password.isEmpty || passwordConfirmation.isEmpty || email.isEmpty {
            throw UserError.emptyField
        }
        if password != passwordConfirmation {
            throw UserError.passwordMismatch
        }
        if !EmailValidator.isValid(email) {
            throw UserError.invalidEmail
        }
        return true
    }
    
    func getInitials() -> String {
        return "\(firstName.prefix(1))\(lastName.prefix(1))"
    }
}
