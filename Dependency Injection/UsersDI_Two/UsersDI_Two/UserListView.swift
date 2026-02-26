//
//  UserListView.swift
//  UsersDI_Two
//
//  Created by Sinuar on 06/02/26.
//

import SwiftUI

// Step 2. Refactor the View

struct UserListView: View {
    
    @StateObject var viewModel: UserListViewModel
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .task {
            await viewModel.loadUsers()
        }
    }
}

#Preview {
  UserListView(viewModel: UserListViewModel(service: UserService()))
}

/*
 ⚠️ Important SwiftUI Detail.
 
 Even though the View receives the ViewModel:
 @StateObject still works.
 SwiftUI now owns its lifecycle.
 The View does not create it.
 
 This is a common point of confusion — but this is correct.
 
 */
