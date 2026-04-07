//
//  UserListViewModel.swift
//  UsersDI_Three
//
//  Created by Sinuar on 06/02/26.
//

import Foundation
import Combine

// Step 3 — Update the ViewModel to Depend on the Protocol.

@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func loadUsers() async {
        users = await service.loadUsers()
    }
}

/*
🎯 This is the big win:
ViewModel no longer cares what the service is
Only cares what it can do
*/
