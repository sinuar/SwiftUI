//
//  AppDependencies.swift
//  UsersDI_five
//
//  Created by Sinuar on 11/02/26.
//

import SwiftUI

// Step 1 — Create a Dependency Container

final class AppDependencies {
    let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
}

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

// MARK: - SwiftUI Environment

struct AppDependenciesKey: EnvironmentKey {
    static let defaultValue: AppDependencies = .live()
}

extension EnvironmentValues {
    var appDependencies: AppDependencies {
        get { self[AppDependenciesKey.self] }
        set { self[AppDependenciesKey.self] = newValue }
    }
}

/*
 🧠 Senior-Level Guideline (Bookmark This)
 Start with fewer files and clearer intent
 Split files when clarity or scale demands it
 Not the other way around.
 */
