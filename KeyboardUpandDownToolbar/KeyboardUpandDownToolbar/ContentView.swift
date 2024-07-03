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
        @State private var currentIndex = 0

        var body: some View {
            NavigationView {
                Form {
                    Section {
                        TextField("Field 1", text: $text1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Field 2", text: $text2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                .navigationBarTitle("Text Fields")
                .customKeyboardToolbar(textFields: [$text1, $text2], currentIndex: $currentIndex)
            }
        }
    }

struct CustomKeyboardToolbar: View {
    @Binding var textFields: [Binding<String>]
    @Binding var currentIndex: Int

    var body: some View {
        HStack {
            Button(action: {
                navigate(-1)
            }) {
                Image(systemName: "chevron.up")
            }

            Button(action: {
                navigate(1)
            }) {
                Image(systemName: "chevron.down")
            }
        }
        .padding(10)
    }

    private func navigate(_ offset: Int) {
        let newIndex = currentIndex + offset
        if newIndex >= 0 && newIndex < textFields.count {
            currentIndex = newIndex
        }
    }
}

struct CustomKeyboardToolbarRepresentable: UIViewRepresentable {
    @Binding var textFields: [Binding<String>]
    @Binding var currentIndex: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
    
    class Coordinator: NSObject {
            var parent: CustomKeyboardToolbarRepresentable

            init(_ parent: CustomKeyboardToolbarRepresentable) {
                self.parent = parent
            }

            @objc func navigatePrevious() {
                parent.parent.textFields[parent.parent.currentIndex - 1].wrappedValue = ""
                parent.parent.currentIndex -= 1
            }

            @objc func navigateNext() {
                parent.parent.textFields[parent.parent.currentIndex + 1].wrappedValue = ""
                parent.parent.currentIndex += 1
            }
        }
    }

struct CustomKeyboardToolbarModifier: ViewModifier {
    @Binding var textFields: [Binding<String>]
    @Binding var currentIndex: Int

    func body(content: Content) -> some View {
        content
            .overlay(CustomKeyboardToolbarRepresentable(textFields: $textFields, currentIndex: $currentIndex))
    }
}

extension View {
    func customKeyboardToolbar(textFields: [Binding<String>], currentIndex: Binding<Int>) -> some View {
        return self.modifier(CustomKeyboardToolbarModifier(textFields: textFields, currentIndex: currentIndex))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardToolbar()
    }
}
