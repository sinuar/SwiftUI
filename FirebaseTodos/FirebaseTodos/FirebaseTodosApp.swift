//
//  FirebaseTodosApp.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import SwiftUI
import Firebase

@main
struct FirebaseTodosApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
