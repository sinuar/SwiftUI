//
//  UsersDI_ThreeApp.swift
//  UsersDI_Three
//
//  Created by Sinuar on 06/02/26.
//

import SwiftUI
// Step 4 — App Remains the Composition Root

@main
struct UsersDI_ThreeApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView(
                viewModel: UserListViewModel(
                    service: MockUserService()
                )
            )
        }
    }
}

/*
 Notice:
 The App knows concrete types.
 The ViewModel does not.
 Perfect separation.
 */
