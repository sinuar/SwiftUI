//
//  TodoListViewModel.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import Foundation
import Combine

@MainActor
final class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var newTodoTitle: String = ""
    @Published var isLoading: Bool = false
    @Published var uiError: UIError?
    
    private let service = TodoService()
    
    func start() {
        isLoading = true
        uiError = nil
        
        service.startListening { [weak self] todos in
            guard let self else { return }
            self.todos = todos
            self.isLoading = false
        }
    }
    
    func stop() {
        service.stopListening()
    }
    
    func addTodo() async {
        guard !newTodoTitle.isEmpty else { return }
        // If the text field is empty or not updating, nothing will happen — silently.
        isLoading = true
        uiError = nil
        
        do {
            try await service.addTodo(title: newTodoTitle)
            newTodoTitle = ""
        } catch {
            uiError = UIError(message: error.localizedDescription)
            isLoading = false
        }
    }
}

/*
 📌 Notice:
 No manual reload
 No async fetch on add
 Firestore drives state
 
 */
