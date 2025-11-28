//
//  Errors.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/28/25.
//

import Foundation

// Used during User creation
enum UserError: Error {
    case emptyField
    case invalidEmail
    case invalidPassword
    case passwordMismatch
}

enum EmailValidator {
    /// Maximum total length as per RFC 5321
    private static let maxEmailLength = 254
    /// Maximum local-part length as per RFC 5321
    private static let maxLocalPartLength = 64

    /// Precompiled NSRegularExpression for performance
    private static let regex: NSRegularExpression = {
        // Allows:
        // - Unquoted local parts with common special chars
        // - Quoted local parts ("John Doe"@example.com)
        // - Standard domain names and literal IPv4 addresses
        let pattern = #"^(?:(?:[A-Za-z0-9_'^&/+-])+(?:\.(?:[A-Za-z0-9_'^&/+-])+)*|"(?:[^"\\]|\\.)+")@(?:(?:[A-Za-z0-9-]+\.)+[A-Za-z]{2,63}|\[(?:[0-9]{1,3}\.){3}[0-9]{1,3}\])$"#
        return try! NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
    }()

    static func isValid(_ email: String) -> Bool {
        // Basic sanity checks
        if email.isEmpty { return false }
        if email.count > maxEmailLength { return false }
        if email.contains(" ") { return false }

        // Local-part length check
        let parts = email.split(separator: "@", maxSplits: 1, omittingEmptySubsequences: false)
        guard parts.count == 2 else { return false }
        if parts[0].count > maxLocalPartLength { return false }

        // Regex check
        let range = NSRange(location: 0, length: email.utf16.count)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    }
}

enum AppStrings: String {
    case bundle = "pottsProjects.Brandons-Todo-List"
}
