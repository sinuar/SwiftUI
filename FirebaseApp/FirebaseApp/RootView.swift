//
//  RootView.swift
//  FirebaseApp
//
//  Created by Sinuar on 18/02/26.
//

import SwiftUI

struct RootView: View {
    @StateObject private var session = SessionManager()
    
    var body: some View {
        Group {
            if session.isAuthenticated {
                Text("Home Screen")
            } else {
                Text("Login Screen")
            }
        }
    }
}
