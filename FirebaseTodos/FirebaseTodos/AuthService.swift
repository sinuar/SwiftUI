//
//  AuthService.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    func logIn(email: String, password: String) async throws
    func logOut() throws
}

final class AuthService: AuthServiceProtocol {
    func logIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(
            withEmail: email,
            password: password)
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
}
