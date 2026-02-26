//
//  SessionManager.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import Foundation
import FirebaseAuth
import Combine

final class SessionManager: ObservableObject {

    @Published var isLoggedIn: Bool = false
    private var authListener: AuthStateDidChangeListenerHandle?

    init() {
        authListener = Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Logout failed: \(error)")
        }
    }
}

/*
 Key idea:
 We do not manually toggle isLoggedIn.
 Firebase is the source of truth.
 SwiftUI reacts automatically.
 This is exactly how Firebase wants to be used.
 
 */
