//
//  AppDependencies.swift
//  UsersDI_Four
//
//  Created by Sinuar on 09/02/26.
//

import Foundation

// Step 1 — Create a Dependency Container

final class AppDependencies {
    let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
}
/*
 This object:
 Knows about concrete implementations.
 Is created once.
 Is passed around as needed.
 */

// Step 2 — Create Default (Production) Dependencies

extension AppDependencies {
    static func live() -> AppDependencies {
        AppDependencies(userService: UserService())
    }
}

// Bonus — Mock Dependencies for Previews.
extension AppDependencies {
    static func mock() -> AppDependencies {
        AppDependencies(userService: MockUserService())
    }
}

/*
 Why this matters:
 Keeps production wiring separate.
 Enables easy swapping later.
 */
