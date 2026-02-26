//
//  UsersDI_TwoApp.swift
//  UsersDI_Two
//
//  Created by Sinuar on 06/02/26.
//

import SwiftUI
// Step 3. Move creation to the App (Composition Root).

@main
struct UsersDI_TwoApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView(
                viewModel: UserListViewModel(
                    service: UserService()
                )
            )
        }
    }
}
