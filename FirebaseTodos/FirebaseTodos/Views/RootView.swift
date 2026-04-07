//
//  RootView.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import SwiftUI

struct RootView: View {
    @StateObject private var sessionManager = SessionManager()
    
    var body: some View {
        Group {
            if sessionManager.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
        
        .environmentObject(sessionManager)
    }
}
