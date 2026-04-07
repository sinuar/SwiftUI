//
//  Todo.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
}
