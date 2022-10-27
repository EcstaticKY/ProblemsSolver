///
/// Created by Zheng Kanyan on 2022/10/4.
/// 
///

import Foundation

func QuickSort(nums: [Int]) -> [Int] {
    var ret = nums
    quickSort(nums: &ret, start: 0, end: nums.count)
    return ret
}

private func quickSort(nums: inout [Int], start: Int, end: Int) {
    guard end - start > 1 else { return }
    
    let pivot = nums[start]
    var startIndex = start
    var endIndex = end - 1
    
    while endIndex > startIndex {
        while endIndex > startIndex && nums[endIndex] >= pivot {
            endIndex -= 1
        }
        nums[startIndex] = nums[endIndex]
        
        while endIndex > startIndex && nums[startIndex] <= pivot {
            startIndex += 1
        }
        nums[endIndex] = nums[startIndex]
    }
    nums[endIndex] = pivot
    
    quickSort(nums: &nums, start: start, end: endIndex)
    quickSort(nums: &nums, start: endIndex + 1, end: end)
}
