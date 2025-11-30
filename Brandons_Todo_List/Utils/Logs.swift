//
//  Logs.swift
//  Brandons_Todo_List
//
//  Created by Brandon Potts on 11/16/25.
//

import os

extension Logger {
    static let notes: Logger = .init(subsystem: AppStrings.bundle.rawValue, category: "notes")

    static let users: Logger = .init(subsystem: AppStrings.bundle.rawValue, category: "users")
}
