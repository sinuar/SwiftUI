//
//  ContentView.swift
//  ToolbarNavigation
//
//  Created by Sinuhé Ruedas on 11/10/23.
//

import SwiftUI

// FIRST EXAMPLE:

//struct ToolbarNavigation: View {
//    @State private var text1: String = ""
//    @State private var text2: String = ""
//    @FocusState private var isTextField1Focused: Bool
//    @FocusState private var isTextField2Focused: Bool
//
//    var body: some View {
//        VStack {
//            Text("Tap the button to navigate")
//                .padding()
//
//            TextField("Enter text in field 1", text: $text1)
//                .focused($isTextField1Focused)
//            TextField("Enter text in field 2", text: $text2)
//                .focused($isTextField2Focused)
//
//            HStack {
//                Button(action: {
//                    isTextField1Focused = false
//                    isTextField2Focused = true
//                }) {
//                    Image(systemName: "chevron.down")
//                }
//                .padding()
//
//                Button(action: {
//                    isTextField1Focused = true
//                    isTextField2Focused = false
//                }) {
//                    Image(systemName: "chevron.up")
//                }
//            }
//        }
//    }
//}


// SECOND EXAMPLE:

//struct ToolbarNavigation: View {
//    @State private var text1: String = ""
//    @State private var text2: String = ""
//    @State private var isTextField1Active: Bool = true
//
//    var body: some View {
//        VStack {
//            Text("Tap the buttons to navigate between text fields:")
//                .padding()
//
//            CustomTextField(text: $text1, isFirstResponder: $isTextField1Active)
//                .padding()
//
//            HStack {
//                Button(action: {
//                    isTextField1Active = true
//                }) {
//                    Image(systemName: "chevron.up")
//                }
//                .padding()
//
//                Button(action: {
//                    isTextField1Active = false
//                }) {
//                    Image(systemName: "chevron.down")
//                }
//                .padding()
//            }
//
//            CustomTextField(text: $text2, isFirstResponder: !$isTextField1Active)
//                .padding()
//        }
//    }
//}
//
//struct CustomTextField: View {
//    @Binding var text: String
//    @Binding var isFirstResponder: Bool
//
//    var body: some View {
//        TextField("Enter text", text: $text)
//            .background(GeometryReader { geo in
//                Color.clear.onAppear {
//                    if isFirstResponder {
//                        DispatchQueue.main.async {
//                            geo.frame(in: .global).origin.y = 0
//                            geo.frame(in: .global).origin.y = 1
//                        }
//                    }
//                }
//            })
//    }
//}


struct ToolbarNavigation: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var isTextField1Active: Bool = true

    var body: some View {
        VStack {
            CustomTextField(text: $text1, isActive: isTextField1Active)
                .padding()

            CustomTextField(text: $text2, isActive: !isTextField1Active)
                .padding()
        }

        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button(action: {
                    isTextField1Active.toggle()
                }) {
                    Image(systemName: "chevron.up")
                }
            }
            ToolbarItem(placement: .keyboard) {
                Button(action: {
                    isTextField1Active.toggle()
                }) {
                    Image(systemName: "chevron.down")
                }
            }
            ToolbarItem(placement: .keyboard) {
                Spacer()
            }
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    UIApplication.shared.windows.first?.endEditing(true)
                }
            }
        }
        .navigationBarTitle("Keyboard Toolbar Example")
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var isActive: Bool

    var body: some View {
        TextField("Enter text", text: $text)
            .opacity(isActive ? 1.0 : 1.0)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter { $0.isKeyWindow }
            .first?
            .endEditing(force)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarNavigation()
    }
}
