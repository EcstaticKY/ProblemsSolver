//
//  TwoSum.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/23.
//

import Foundation

func TwoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    if numbers.count < 2 {
        return []
    }
    if numbers.count == 2 {
        return numbers[0] + numbers[1] == target ? [0, 1] : []
    }
    var hashDict: [Int: Int] = [:]
    for (index, element) in numbers.enumerated() {
        let remain = target - element
        if let otherIndex = hashDict[remain], otherIndex != index {
            return [otherIndex, index]
        } else {
            hashDict[element] = index
        }
    }
    return []
}

func reverse(_ x: Int) -> Int {
//        if x <= Int32.min {
//            return 0
//        }
    var remain = x > 0 ? x : x * -1
    var result = 0
    while remain > 0 {
        result = result * 10 + remain % 10
        remain = remain / 10
    }
    if result > Int32.max {
        return 0
    }
    return x > 0 ? result : result * -1
}

/// Test code
//print(Solution().reverse(-123))
//print(Int32.min)
//
//let testNumbers1 = [3, 2, 4], target1 = 6
//let result1 = Solution().twoSum(testNumbers1, target1)
//print(result1)
