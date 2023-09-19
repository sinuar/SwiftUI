//
//  RefreshContainerViewModel.swift
//  RefreshContainer
//
//  Created by Sinuhé Ruedas on 11/09/23.
//

import Combine

public extension RefreshContainer {
    // Accessibility data for RefreshContainer
    struct Accessibility {
        public var identifier: String
        var loaderIdentifier: String {
            "\(identifier)Loader"
        }
        // Accessibility initialization
        // Parameter: identifier.
        public init(identifier: String = "RefreshContainer") {
            self.identifier = identifier
        }
    }
    
    // ViewModel of RefreshContainer
    final class ViewModel: ObservableObject {
        @Published public var accessibility: Accessibility
        // ViewModel initialization
        public init(accessibility: Accessibility) {
            self.accessibility = accessibility
        }
    }
}
