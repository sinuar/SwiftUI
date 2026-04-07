//
//  UserServiceProtocol.swift
//  UsersDI_Four
//
//  Created by Sinuar on 09/02/26.
//

import Foundation

// Step 1 — Define the Service Protocol.

protocol UserServiceProtocol {
    func loadUsers() async -> [User]
}
