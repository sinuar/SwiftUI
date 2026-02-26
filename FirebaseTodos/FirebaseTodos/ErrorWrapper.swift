//
//  ErrorWrapper.swift
//  FirebaseTodos
//
//  Created by Sinuar on 19/02/26.
//

import Foundation

struct UIError: Identifiable {
    let id: UUID = UUID()
    let message: String
}
