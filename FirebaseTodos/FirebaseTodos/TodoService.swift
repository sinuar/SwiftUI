//
//  TodoService.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class TodoService {
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    private var userID: String {
        guard let userID = Auth.auth().currentUser?.uid else {
            fatalError("User must be logged in")
        }
        return userID
    }
    
    func startListening(
        onChange: @escaping ([Todo]) -> Void
    ) {
        listener = db
            .collection("users")
            .document(userID)
            .collection("todos")
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("Error fetching snapshots: \(error!)")
                    return
                }
                
                let todos = documents.compactMap {
                    try? $0.data(as: Todo.self)
                }
                
                onChange(todos)
            }
    }
    
    func stopListening() {
        listener?.remove()
        listener = nil
    }
    
    // MARK: - Create
    
    func addTodo(title: String) async throws {
        let id = UUID().uuidString
        let todo = Todo(
            id: id,
            title: title,
            isCompleted: false
        )
        
        try db
            .collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .setData(from: todo)
    }
}

/*
 Why This Is Important
 
 ListenerRegistration must be stored.
 You must remove listeners.
 Otherwise: memory leaks + duplicate updates.
 This is where many apps go wrong.
 
 */
