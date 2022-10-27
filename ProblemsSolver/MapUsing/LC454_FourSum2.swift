//
//  LC454_FourSum2.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

/** My own 思路：
 nums1 和 nums2 看成一个整体，nums3 和 nums4 看成一个整体分别生成 map [ Int: Int ]
 key 为和，value 为该和的组合数量
 然后遍历 map1, 找对应的 map2 的 value，两个 value 相乘得到该组合数
 这样时间复杂度为 n^2，空间复杂度为 n^2 因为最坏的情况下相加后每个数都不一样
 优化一下不用构建 map2，遍历 nums3 和 nums4 的时候找到合适的值直接结果 ++ 即可
 */
func FourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
    var map = [Int: Int]()
    
    for num1 in nums1 {
        for num2 in nums2 {
            let sum = num1 + num2
            if let count = map[sum] {
                map[sum] = count + 1
            } else {
                map[sum] = 1
            }
        }
    }
    
    var result = 0
    for num3 in nums3 {
        for num4 in nums4 {
            let sum = num3 + num4
            if let count = map[-sum] {
                result += count
            }
        }
    }
    
    return result
}
