//
//  UsersDI_FourApp.swift
//  UsersDI_Four
//
//  Created by Sinuar on 09/02/26.
//

import SwiftUI

// Step 3 — Update UsersApp to Use the Container

@main
struct UsersDI_FourApp: App {
    private let dependencies = AppDependencies.live()

    var body: some Scene {
        WindowGroup {
            UserListView(
                viewModel: UserListViewModel(
                    service: dependencies.userService
                )
            )
        }
    }
}

/*
 Your app now has:
 A single source of truth for dependencies.
 Clean UI code.
 Explicit wiring.
 
 Mental Model Upgrade
 The App owns dependencies
 The View displays
 The ViewModel coordinates
 The Service executes
 Clean layers. No leaks.
 */
