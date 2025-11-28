//
//  Utils.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/17/25.
//

import Foundation

func isValidEmail(_ email: String) throws -> Bool {
    let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
    let range = NSRange(email.startIndex..., in: email)
    let matches = detector?.matches(in: email, options: [], range: range)
    
    // Check if there's exactly one match and it's a mailto URL covering the entire string
    guard let match = matches?.first, matches?.count == 1 else {
        throw UserError.invalidEmail
    }
    
    return match.range == range && match.url?.scheme == "mailto"
}
