//
//  UserService.swift
//  UsersDI_Three
//
//  Created by Sinuar on 06/02/26.
//

import Foundation
// Step 2 — Make the Concrete Service Conform.

final class UserService: UserServiceProtocol {
    func loadUsers() async -> [User] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return [
            User(id: 1, name: "Alice"),
            User(id: 2, name: "Bren"),
            User(id: 3, name: "Grisel")]
    }
}

// No logic change — just conformance.

