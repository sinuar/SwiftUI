//
//  UserListView.swift
//  UsersDI_five
//
//  Created by Sinuar on 11/02/26.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel: UserListViewModel
    
    init (viewModel: UserListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
    UserListView(
        viewModel: UserListViewModel(
            service: MockUserService()
        )
    )
}
