//
//  LoginViewModel.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }
    
    func login() async {
        do {
            try await authService.logIn(
                email: email,
                password: password
            )
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}

/*
 📌 Notice:
 No Firebase import
 No navigation logic
 Clean responsibility
 */
