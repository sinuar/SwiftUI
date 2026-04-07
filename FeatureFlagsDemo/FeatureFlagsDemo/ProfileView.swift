//
//  ProfileView.swift
//  FeatureFlagsDemo
//
//  Created by Sinuar on 05/03/26.
//

import SwiftUI

struct ProfileView: View {
    private let featureFlags = LocalFeatureFlagProvider()
    
    var body: some View {
        if featureFlags.isEnabled(.newProfile) {
            NewProfileView()
        } else {
            OldProfileView()
        }
    }
}

#Preview {
    ProfileView()
}
