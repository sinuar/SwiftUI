//
//  UserService.swift
//  UsersDI
//
//  Created by Sinuar on 06/02/26.
//
import Foundation

// Step 2. Create the service (Hard coded)

final class UserService {
    func loadUsers() async -> [User] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return [
            User(id: 1, name: "Alice"),
            User(id: 2, name: "Bren"),
            User(id: 3, name: "Grisel")]
    }
}
// This is intentionally not protocol-based.

