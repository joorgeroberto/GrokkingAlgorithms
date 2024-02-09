import Foundation
import XCTest

class BinarySearch {
    func binarySearch<T: Comparable>(list: [T], item: T) -> Int? {
        var low = 0
        var high = list.count - 1
        
        while low <= high {
            let mid = (low + high) / 2
            let guess = list[mid]
            if guess == item {
                return mid
            }
            if guess > item {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return nil
    }
}

let numberList = [1, 3, 5, 7, 9]
print(BinarySearch().binarySearch(list: numberList, item: 3) ?? "Not Found")
print(BinarySearch().binarySearch(list: numberList, item: -1) ?? "Not Found")


let letterList = ["a", "b", "d", "e", "t"]
print(BinarySearch().binarySearch(list: letterList, item: "e") ?? "Not Found")
print(BinarySearch().binarySearch(list: letterList, item: "z") ?? "Not Found")


class BinarySearchTests: XCTestCase {
    func test_should_found_value_in_the_begin_of_array_with_success() {
        let testArray = [2,5,8,12,16,23,38,56,72,91]
        let value = BinarySearch().binarySearch(list: testArray, item: 2)
        XCTAssertEqual(value, 0)
    }

    func test_should_found_value_in_the_middle_of_array_with_success() {
        let value = BinarySearch().binarySearch(list: [0,1,2,3,4,5,6], item: 3)
        XCTAssertEqual(value, 3)
    }

    func test_should_found_value_in_the_end_of_array_with_success() {
        let value = BinarySearch().binarySearch(list: [0,1,2,3,4,5,6], item: 6)
        XCTAssertEqual(value, 6)
    }

    func test_should_found_value_in_the_first_half_of_array_with_success() {
        let value = BinarySearch().binarySearch(list: [0,1,2,3,4,5,6], item: 2)
        XCTAssertEqual(value, 2)
    }

    func test_should_found_value_in_the_second_half_of_array_with_success() {
        let value = BinarySearch().binarySearch(list: [0,1,2,3,4,5,6], item: 5)
        XCTAssertEqual(value, 5)
    }

    func test_should_found_value_with_error() {
        let value = BinarySearch().binarySearch(list: [0,1,2,3,4,5,6], item: 7)
        XCTAssertEqual(value, nil)
    }
}

BinarySearchTests.defaultTestSuite.run()
