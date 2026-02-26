//
//  MockUserService.swift
//  UsersDI_Three
//
//  Created by Sinuar on 06/02/26.
//

import Foundation
// 🔥 Proof: Swap the Implementation (No Refactor). Create a Mock Service.

final class MockUserService: UserServiceProtocol {
    func loadUsers() async -> [User] {
        return [
            User(id: 1, name: "Sinuar"),
            User(id: 2, name: "Fathur"),
            User(id: 3, name: "Rizky"),
        ]
    }
}
