//
//  SessionManager.swift
//  FirebaseApp
//
//  Created by Sinuar on 18/02/26.
//

import Foundation
import FirebaseAuth
import Combine

final class SessionManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    init() {
        Auth.auth().addStateDidChangeListener { _, user in
            self.isAuthenticated = user != nil
        }
    }
}
