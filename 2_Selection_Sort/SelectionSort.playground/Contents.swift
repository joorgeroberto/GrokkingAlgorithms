import UIKit
import XCTest

class SelectionSort {
    func findSmallestValueIndex<T: Comparable>(arr: [T]) -> Int {
        var smallestValue = arr[0]
        var smallestValueIndex: Int = 0

        for (index, element) in arr.enumerated() {
            if arr[index] < smallestValue {
                smallestValue = arr[index]
                smallestValueIndex = index
            }
        }

        return smallestValueIndex
    }

    func selectionSort<T: Comparable>(arr: [T]) -> [T] {
        guard arr.count > 1 else { return arr }
        
        // We have to make mutableArray reference copy of original array, because Swift 3 doesn't allow to get var parameter.
        var mutableList = arr
        var newArray: [T] = []
        for (index, element) in mutableList.enumerated() {
            let smallestValueIndex = findSmallestValueIndex(arr: mutableList)
            newArray.append(mutableList.remove(at: smallestValueIndex))
        }
        return newArray
    }
}

print(SelectionSort().selectionSort(arr: [5, 3, 6, 2, 10]))
print(SelectionSort().selectionSort(arr: [5, 3, 4, 1, 2]))

print(SelectionSort().selectionSort(arr: ["u", "i", "o", "p", "a", "u"]))
print(SelectionSort().selectionSort(arr: ["q", "w", "e", "r", "t", "y"]))

func test_should_return_test_array_with_one_element_with_success() {
    let testArray = [10]
    let sortedArray = SelectionSort().selectionSort(arr: testArray)
    XCTAssertEqual([10], sortedArray)
}

class SelectionSortTests: XCTestCase {
    func test_should_return_test_array_with_one_element_with_success() {
        let testArray = [10]
        let sortedArray = SelectionSort().selectionSort(arr: testArray)
        XCTAssertEqual([10], sortedArray)
    }

    func test_should_sort_test_array_with_success() {
        let testArray = [23, 8, 5, 38, 72, 12, 2, 91, 56, 16]
        let sortedArray = SelectionSort().selectionSort(arr: testArray)
        XCTAssertEqual([2, 5, 8, 12, 16, 23, 38, 56, 72, 91], sortedArray)
    }
    
    func test_should_find_smallest_array_number_with_success() {
        let testArray = [23, 8, 5, 38, 72, 12, 2, 91, 56, 16]
        let smallestValueIndex = SelectionSort().findSmallestValueIndex(arr: testArray)
        XCTAssertEqual(6, smallestValueIndex)
    }

    func test_should_sort_test_array_with_letters_with_success() {
        let testArray = ["j", "a", "i", "f", "b", "g", "c", "h", "d", "e"]
        let sortedArray = SelectionSort().selectionSort(arr: testArray)
        XCTAssertEqual(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"], sortedArray)
    }

    func test_should_find_smallest_array_letter_with_success() {
        let testArray = ["j", "a", "i", "f", "b", "g", "c", "h", "d", "e"]
        let smallestValueIndex = SelectionSort().findSmallestValueIndex(arr: testArray)
        XCTAssertEqual(1, smallestValueIndex)
    }
}

SelectionSortTests.defaultTestSuite.run()

