//
//  UserViewModel.swift
//  AsyncAwaitDemo
//
//  Created by Sinuar on 13/03/26.
//

import Foundation
import Combine

@MainActor
final class UserViewModel: ObservableObject {
    @Published var user: User?
    
    private let service = UserService()
    
    func loadUser() {
        Task {
            do {
                let user = try await self.service.fetchUser()
                self.user = user
            } catch {
                print("Error", error)
            }
        }
    }
}
