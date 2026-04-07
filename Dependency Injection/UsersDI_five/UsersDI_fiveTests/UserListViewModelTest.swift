//
//  UserListViewModelTest.swift
//  UsersDI_five
//
//  Created by Sinuar on 11/02/26.
//

import XCTest
@testable import UsersDI_five

@MainActor
final class UserListViewModelTest: XCTestCase {
    func test_loadUsers_setsUsersFromService() async {
        // Arrange
        let mockService = MockUserService()
        mockService.usersToReturn = [
            User(id: 1, name: "Foo"),
            User(id: 2, name: "Bar")
        ]
        
        let viewModel = UserListViewModel(service: mockService)
        
        // Act
        await viewModel.loadUsers()
        
        // Assert
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users.first?.name, "Foo")
    }
    
    func test_loadUsers_withEmptyResult_setsEmptyUsers() async {
        let mockService = MockUserService()
        mockService.usersToReturn = []
        
        let viewModel = UserListViewModel(service: mockService)
        
        await viewModel.loadUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
    }
}


