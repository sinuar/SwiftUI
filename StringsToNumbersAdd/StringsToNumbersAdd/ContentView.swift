//
//  ContentView.swift
//  StringsToNumbersAdd
//
//  Created by Sinuar on 22/02/24.
//

import SwiftUI

/*
 I need to create a function called 'stringsToNumbers' which receives two arrays
 of integers in the form of strings like this:
 
 ["2", "3", "6"], ["1", "2"]
 
 The function should get the numeric value of the first array and add it to the
 numeric value of the second integer. For example, in this case: 236 + 12 and
 then deliver an integer as result, in this case: 248.
 */

struct ContentView: View {
    
    func stringToNumbers(firstArray: [String], secondArray: [String]) -> Int {
        
        // Convert array of strings to integers
        
        let number1 = Int(firstArray.joined()) ?? 0
        
        guard let number2 = Int(secondArray.joined()) else {
            return 0
        }
        
        print(number1)
        print(number2)
        // Perform addition
        let resultStr = number1 + number2
        
        print("the result of strings is \(resultStr)")
        
        return resultStr
    }
    
    
    // NOW WITH INTEGERS AS INPUT
    
    func addingNumbers(firstArray: [Int], secondArray: [Int]) -> Int {
        var number1 = 0
        for number in firstArray {
            number1 = number1 * 10 + number
        }
        
        var number2 = 0
        for number in secondArray {
            number2 = number2 * 10 + number
        }
        
        let result = number1 + number2
        
        print(number1)
        print(number2)
        print("result is \(result)")
        
        return result
    }
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onAppear {
                    _ = stringToNumbers(firstArray: ["3", "4", "5"], secondArray: ["2", "4"])
                    _ = addingNumbers(firstArray: [2, 4, 7], secondArray: [3, 8])
                }
        }
        .padding()
    }
}



#Preview {
    ContentView()
}
