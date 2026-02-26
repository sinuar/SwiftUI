//
//  UserListViewModel.swift
//  UsersDI
//
//  Created by Sinuar on 06/02/26.
//

import Foundation
import Combine
// Step 4: Create the ViewModel (❌ Anti-pattern)

@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    private let service = UserService() // 🚨 hard dependency
    
    func loadUsers() async {
        users = await service.loadUsers()
    }
}

/*
 What’s wrong here (on purpose):
 - ViewModel creates its dependency
 - Impossible to mock
 - Strong coupling
 
 This means:
 UserListViewModel decides which service it uses.
 It’s tightly coupled to UserService.
 You cannot replace it without editing the ViewModel.
 
 In DI terms:
 The dependent (UserListViewModel) should not create the dependency (UserService).
 
 WHAT WE WANT INSTEAD:
 
 final class UserListViewModel {
     private let service: UserService

     init(service: UserService) {
         self.service = service
     }
 }

 Now:
 The ViewModel doesn’t care where the service comes from.
 It only knows “I need something that behaves like UserService”.
 Much easier to test, swap, or evolve later.
 👉 This is constructor injection, and it’s the gold standard.
 
 */
