//
//  ContentView.swift
//  propertyWrappers
//
//  Created by Sinuar on 07/02/24.
//

import SwiftUI

final class CounterViewModel: ObservableObject {
    @Published var count = 0
    
    func incrementCounter() {
        count += 1
    }
}

struct ContentView: View {
    var body: some View {
        @ObservedObject var viewModel = CounterViewModel()

        
        VStack {
            RandomNumberView(counterViewModel: viewModel)
        }
    }
}

struct CounterView: View {
    /// Using @StateObject.
    // @StateObject var viewModel = CounterViewModel()
    
    /// Using @ObservedObject instead.
    @ObservedObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Count is \(viewModel.count)")
            Button("Increment counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

struct RandomNumberView: View {
    @State var randomNumber = 0
    @ObservedObject var counterViewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("Count is \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
            Button("Plus Two") {
                counterViewModel.count += 2
            }
            .tint(.cyan)
        }.padding(.bottom)
        CounterView(viewModel: counterViewModel)
    }
}

#Preview {
    ContentView()
}

/// The randomNumber property marked by the @State property wrapper will 
/// redraw the view causing our CounterView to be regenerated.
/// You’ll see the counter resetting if we use @ObservedObject inside our CounterView
/// once a new random number generates
///
/// The fix is as simple as changing the CounterView view model property to be a @StateObject
/// instead of an @ObservedObject. As described above, the state object makes sure
/// the view model retains between view redraws and ensures our counter values remain the same.
