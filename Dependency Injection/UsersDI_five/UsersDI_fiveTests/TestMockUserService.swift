//
//  TestMockUserService.swift
//  UsersDI_fiveTests
//
//  Created by Sinuar on 11/02/26.
//

import Foundation

@testable import UsersDI_five

final class MockUserService: UserServiceProtocol {
    var usersToReturn: [User] = []
    
    func loadUsers() async -> [User] {
        usersToReturn
    }
}
