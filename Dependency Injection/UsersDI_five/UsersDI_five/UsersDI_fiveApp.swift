//
//  UsersDI_fiveApp.swift
//  UsersDI_five
//
//  Created by Sinuar on 11/02/26.
//

import SwiftUI

// Step 3 — Update UsersApp to Use the Container

@main
struct UsersDI_fiveApp: App {
    private let dependencies = AppDependencies.live()

    var body: some Scene {
        WindowGroup {
            UserListView(
                viewModel: UserListViewModel(
                    service: dependencies.userService)
                )
        }
    }
}
