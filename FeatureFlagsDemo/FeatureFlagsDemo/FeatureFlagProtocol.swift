//
//  FeatureFlagProvider.swift
//  FeatureFlagsDemo
//
//  Created by Sinuar on 05/03/26.
//

import Foundation

protocol FeatureFlagProtocol {
    func isEnabled(_ feature: Feature) -> Bool
}

/*
 This abstraction is very important.
 It allows us to later swap:
 Local flags
 Remote flags
 A/B testing flags
 Test mocks
 without changing the rest of the app.
 */
