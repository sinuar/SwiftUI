//
//  HomeView.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TodoListViewModel()
    @EnvironmentObject private var sessionManager: SessionManager
    
    var body: some View {
        VStack {
            HStack {
                Text("My To do List")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button ("Logout") {
                    sessionManager.logout()
                }
            }
            .padding(.horizontal)
            
            ZStack {
                List(viewModel.todos) { todo in
                    Text(todo.title)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.2)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(8)
                }
            }
            
            HStack {
                TextField("New to do", text: $viewModel.newTodoTitle)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    Task {
                        await viewModel.addTodo()
                    }
                }
                .disabled(viewModel.newTodoTitle.isEmpty || viewModel.isLoading)
            }
            .padding()
            .alert(item: $viewModel.uiError) { error in
                Alert(
                    title: Text("Something went wrong"),
                    message: Text(error.message),
                    dismissButton: .default(Text("OK"))
                )
            }
           
        }
        .padding()
        
        .onAppear {
            viewModel.start()
        }
        .onDisappear {
            viewModel.stop()
        }
    }
}

#Preview {
    HomeView()
}

/*
 Test scenarios:
 Add a todo → appears instantly
 Restart app → todos appear instantly
 Open Firestore Console → add a document manually → UI updates
 (Optional) Open app on two simulators → syncs live
 ✔️ No reload
 ✔️ No refresh
 ✔️ No .task {}
 
 */
