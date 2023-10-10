//
//  ContentView.swift
//  KeyboardUpandDownToolbar
//
//  Created by Sinuhé Ruedas on 10/10/23.
//

import SwiftUI

struct KeyboardToolbar: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Field 1", text: $text1)
                        .overlay(TextFieldToolbar(text: $text1, isEditing: $isEditing))
                        .keyboardType(.default)
                        .onTapGesture {
                            isEditing = true
                        }

                    TextField("Field 2", text: $text2)
                        .overlay(TextFieldToolbar(text: $text2, isEditing: $isEditing))
                        .keyboardType(.default)
                        .onTapGesture {
                            isEditing = true
                        }
                }
            }
            .navigationBarTitle("Text Fields")
        }
    }
}

struct TextFieldToolbar: View {
    @Binding var text: String
    @Binding var isEditing: Bool

//    var body: some View {
//        if isEditing {
//            return AnyView(
//                TextField(" ", text: $text) // A hidden text field to trigger keyboard toolbar
//                    .keyboardType(.default)
//                    .padding(0)
//                    .frame(height: 0)
//            )
//        } else {
//            return AnyView(EmptyView())
//        }
//    }
    
    var body: some View {
        HStack {
            Button(action: {
                isEditing = false
                // To the previous text field
            }) {
                Image(systemName: "chevron.up")
            }
            .disabled(!isEditing)
            
            Spacer()
            
            Button(action: {
                isEditing = false
                // To the next text field
            }) {
                Image(systemName: "chevron.down")
            }
            .disabled(!isEditing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardToolbar()
    }
}
