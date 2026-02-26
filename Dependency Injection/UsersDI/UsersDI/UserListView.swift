//
//  UserListView.swift
//  UsersDI
//
//  Created by Sinuar on 06/02/26.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel = UserListViewModel()
    
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
    UserListView()
}
