func calculateMinMaxSum(numbers: [Int]) -> (minSum: Int, maxSum: Int)? {
	guard numbers.count == 5 else {
		return nil
	}

	var sortedNumbers = numbers
	sortedNumbers.sort()

	var minSum = 0
	var maxSum = 0

	// Minimum sum
	for i in 0..<4 {
		minSum += sortedNumbers[i]
	}

	// Maximum sum
	for i in 1..<5 {
		maxSum += sortedNumbers[i]
	}
	return (minSum, maxSum)
}

let numbers = [4, 8, 1, 5, 7]

if let result = calculateMinMaxSum(numbers: numbers) {
	print("Minimum sum: \(result.minSum), Maximum sum: \(result.maxSum)")
} else {
	print("Array must contain exactly five numbers")
}



<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

import UIKit

func calculateMinMaxSum(numbers: [Int]) -> (minSum: Int, maxSum: Int)? {
    guard numbers.count == 5 else {
        return nil
    }
    
    let sortedNumbers = numbers.sorted()
    
    let minSum = sortedNumbers.prefix(4).reduce(0, +)
    var maxSum = sortedNumbers.suffix(4).reduce(0, +)
    
    return (minSum, maxSum)
}
    
let numbers = [4, 8, 1, 5, 7]

if let result = calculateMinMaxSum(numbers: numbers) {
    print("Minimum sum: \(result.minSum), Maximum sum: \(result.maxSum)")
} else {
    print("Array must contain exactly five numbers")
}

