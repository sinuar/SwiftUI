//
//  UserListViewModel.swift
//  UsersDI_Two
//
//  Created by Sinuar on 06/02/26.
//

import Foundation
import Combine

// Step 1 — Refactor the ViewModel

@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    private let service: UserService
    
    init(service:UserService) {
        self.service = service
    }
    func loadUsers() async {
        users = await service.loadUsers()
    }
}

/*
 ✅ What changed:
 
 Removed UserService() creation.
 Added dependency through init.
 
 This is constructor injection.
 
 */
