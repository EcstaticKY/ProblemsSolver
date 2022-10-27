//
//  LC220_ContainsDuplicateIII.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/21.
//

import Foundation

func ContainsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
    var startIndex = 0
    var endIndex = startIndex
    
    var numSet = Set<Int>()
    while endIndex <= nums.count - 1 {
        let currentNum = nums[endIndex]
    
        if let _ = numSet.first(where: { num in
            abs(num - currentNum) <= valueDiff
        }) {
            return true
        }
        
        numSet.insert(currentNum)
        endIndex += 1
        if endIndex - startIndex > indexDiff {
            numSet.remove(nums[startIndex])
            startIndex += 1
        }
    }
    
    return false
}
