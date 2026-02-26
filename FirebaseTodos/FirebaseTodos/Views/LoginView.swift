//
//  LoginView.swift
//  FirebaseTodos
//
//  Created by Sinuar on 18/02/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.largeTitle)
            
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $viewModel.password)
            
            Button("Login") {
                Task {
                    await viewModel.login()
                }
            }
             
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
