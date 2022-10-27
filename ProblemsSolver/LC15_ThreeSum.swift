//
//  LC15_ThreeSum.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

/*
 15. 三数之和 —— 难度中等
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 
 思路：去掉一个数的两数之和，因为要求不重复，所以中间会去掉重复的数据
 Time: O(NLogN + N^2)
 Space: O(N)
 */
func ThreeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else { return [[Int]]() }
    
    var result = [[Int]]()
    let sortedNums = nums.sorted()
    
    for i in 0..<sortedNums.count-2 {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        searchPair(sortedNums, -sortedNums[i], i + 1, &result)
    }
    
    return result
}

private func searchPair(_ sortedArr: [Int], _ target: Int, _ left: Int, _ result: inout [[Int]]) {
    var leftIdx = left
    var rightIdx = sortedArr.endIndex - 1
    while leftIdx < rightIdx {
        let sum = sortedArr[leftIdx] + sortedArr[rightIdx]
        if sum == target {
            result.append([-target, sortedArr[leftIdx], sortedArr[rightIdx]])
            leftIdx += 1
            while leftIdx < rightIdx && sortedArr[leftIdx] == sortedArr[leftIdx - 1]  {
                leftIdx += 1
            }
            rightIdx -= 1
            while leftIdx < rightIdx && sortedArr[rightIdx] == sortedArr[rightIdx + 1] {
                rightIdx -= 1
            }
        } else if sum > target {
            rightIdx -= 1
        } else {
            leftIdx += 1
        }
    }
}
