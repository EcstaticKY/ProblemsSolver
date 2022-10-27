//
//  LC18_FourSum.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

/*
 18. 四数之和
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，
 使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 注意：答案中不可以包含重复的四元组。
 思路：先排序，一数 + 三数之和（一数 + 两数之和）
 */
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    if nums.count < 4 {
        return result
    }
    
    let sortedNums = nums.sorted()
    let length = sortedNums.count
    var first = 0
    while first <= length - 4 {
        if first > 0 {
            while first <= length - 4
                && sortedNums[first] == sortedNums[first - 1] {
                first += 1
            }
        }
        let target1 = target - sortedNums[first]
        var second = first + 1
        while second <= length - 3 {
            if second > first + 1 {
                while second <= length - 3
                    && sortedNums[second] == sortedNums[second - 1] {
                    second += 1
                }
            }
            let target2 = target1 - sortedNums[second]
            var third = second + 1
            var fourth = length - 1
            while third < fourth {
                let sum = sortedNums[third] + sortedNums[fourth]
                if target2 == sum {
                    result.append([sortedNums[first], sortedNums[second], sortedNums[third], sortedNums[fourth]])
                    third += 1
                    fourth -= 1
                    while third < fourth && sortedNums[third] == sortedNums[third - 1] {
                        third += 1
                    }
                    while third < fourth && sortedNums[fourth] == sortedNums[fourth + 1] {
                        fourth -= 1
                    }
                } else if sum > target2 {
                    fourth -= 1
                } else {
                    third += 1
                }
            }
            second += 1
        }
        first += 1
    }
    
    return result
}
