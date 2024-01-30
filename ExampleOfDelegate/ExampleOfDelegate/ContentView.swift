//
//  ContentView.swift
//  ExampleOfDelegate
//
//  Created by Sinuar on 30/01/24.
//

import SwiftUI

// Define a protocol for the delegate
protocol MyListViewDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

struct ContentView: View {
    @State private var selectedItemIndex: Int?

    // Declare a weak reference to the delegate
    weak var delegate: MyListViewDelegate?

    var body: some View {
        NavigationView {
            List(0..<5, id: \.self) { index in
                NavigationLink(destination: Text("Item \(index + 1) Detail")) {
                    Text("Item \(index + 1)")
                        .onTapGesture {
                            // Update the selected item index and notify the delegate
                            selectedItemIndex = index
                            delegate?.didSelectItem(at: index)
                        }
                }
            }
            .navigationTitle("My List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class AnotherClass: MyListViewDelegate {
    var contentView: ContentView!

    init() {
        // Create an instance of ContentView and set itself as the delegate
        contentView = ContentView()
        contentView.delegate = self
    }

    func didSelectItem(at index: Int) {
        print("Selected item at index \(index)")
        // Handle the selection logic here
    }
}

// Create an instance of AnotherClass to see the delegation in action


#Preview {
    ContentView()
    
    let example = AnotherClass()
    example.contentView // Accessing contentView to display in SwiftUI Live Preview
}
