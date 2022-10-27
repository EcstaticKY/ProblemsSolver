//
//  LC219_ContainsNearbyDuplicate.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/21.
//

import Foundation

func ContainsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var startIndex = 0
    var endIndex = startIndex
    
    var numSet = Set<Int>()
    while endIndex <= nums.count - 1 {
        let currentNum = nums[endIndex]
        guard !numSet.contains(currentNum) else { return true }
        
        numSet.insert(currentNum)
        endIndex += 1
        if endIndex - startIndex > k {
            numSet.remove(nums[startIndex])
            startIndex += 1
        }
    }
    
    return false
}
