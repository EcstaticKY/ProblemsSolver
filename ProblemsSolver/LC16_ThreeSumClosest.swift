//
//  LC16_ThreeSumClosest.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

/*
 16. 最接近的三数之和
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，
 使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 和LC15 三数之和差不多
 */
func ThreeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let sortedNums = nums.sorted()
    var result = Int.max
    
    for i in 0..<sortedNums.count-2 {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        searchPairClosest(sortedNums, target - sortedNums[i], i + 1, &result)
        if result == 0 {
            break
        }
    }
    
    return target - result
}

private func searchPairClosest(_ sortedArr: [Int], _ target: Int, _ left: Int, _ result: inout Int) {
    var leftIdx = left
    var rightIdx = sortedArr.endIndex - 1
    while leftIdx < rightIdx {
        let sum = sortedArr[leftIdx] + sortedArr[rightIdx]
        if sum == target {
            result = 0
            return
        } else {
            if abs(target - sum) < abs(result) {
                result = target - sum
            }
            if sum > target {
                rightIdx -= 1
                while leftIdx < rightIdx && sortedArr[rightIdx] == sortedArr[rightIdx + 1] {
                    rightIdx -= 1
                }
            } else {
                leftIdx += 1
                while leftIdx < rightIdx && sortedArr[leftIdx] == sortedArr[leftIdx] - 1 {
                    leftIdx += 1
                }
            }
        }
    }
}
