//
//  UserServiceProtocol.swift
//  UsersDI_Three
//
//  Created by Sinuar on 06/02/26.
//

import Foundation

// Step 1 — Define the Service Protocol.

protocol UserServiceProtocol {
    func loadUsers() async -> [User]
}
