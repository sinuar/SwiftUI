//
//  UserListView.swift
//  UsersDI_Four
//
//  Created by Sinuar on 09/02/26.
//

import SwiftUI

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
    let dependencies = AppDependencies.live()
    return UserListView(
        viewModel: UserListViewModel(
            service: dependencies.userService)
        )
}
