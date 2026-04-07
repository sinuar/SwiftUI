//
//  UserService.swift
//  AsyncAwaitDemo
//
//  Created by Sinuar on 13/03/26.
//

import Foundation

final class UserService {
    
    func fetchUser() async throws -> User {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {
            fatalError("Invalid URL")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }
}
