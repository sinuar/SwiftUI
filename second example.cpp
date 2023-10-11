// SECOND EXAMPLE:

//struct ToolbarNavigation: View {
//    @State private var text1: String = ""
//        @State private var text2: String = ""
//        @State private var isTextField1Active: Bool = true
//
//    var body: some View {
//        VStack {
//            Text("Tap the buttons to navigate between text fields:")
//                .padding()
//
//            CustomTextField(text: $text1, isActive: isTextField1Active)
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
//            CustomTextField(text: $text2, isActive: !isTextField1Active)
//                .padding()
//        }
//    }
//}
//
//struct CustomTextField: View {
//    @Binding var text: String
//    var isActive: Bool
//
//    var body: some View {
//        TextField("Enter text", text: $text)
//            .opacity(isActive ? 1.0 : 0.0) // Hide the inactive text field
//    }
//}



// THIRD EXAMPLE:
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