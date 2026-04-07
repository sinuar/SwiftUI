//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Sinuar on 18/02/26.
//

import SwiftUI

@main
struct FirebaseAppApp: App {
    
    init() {
        FirebaseAppApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
