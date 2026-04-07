//
//  LocalFeatureFlagProvider.swift
//  FeatureFlagsDemo
//
//  Created by Sinuar on 05/03/26.
//

import Foundation

final class LocalFeatureFlagProvider: FeatureFlagProtocol {
    
    func isEnabled(_ feature: Feature) -> Bool {
        switch feature {
        case .newProfile:
            return false
        }
    }
}
