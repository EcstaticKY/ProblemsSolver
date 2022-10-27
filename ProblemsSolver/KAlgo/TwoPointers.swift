//
//  TwoPointers.swift
//  KAlgo
//
//  Created by Zheng Kanyan on 2020/8/20.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import Foundation

// Given an array of sorted numbers and a target sum,
// find a pair in the array whose sum is equal to the given target.
// Space: O(N), Time: O(1)
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var left = numbers.startIndex
    var right = numbers.endIndex - 1
    
    while left < right {
        let currentSum = numbers[left] + numbers[right]
        if currentSum == target {
            return [left, right]
        } else if currentSum > target {
            right -= 1
        } else {
            left += 1
        }
    }
    
    return [-1, -1]
}

/*
 LeetCode Problem 1 两数之和
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 Time: O(N)
 Space: O(N) worst case
 */
func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
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

/*
 LeetCode Problem 26
 给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
 */
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {
        return nums.count
    }
    
    var nextNonDuplicate = 1
    for index in 1..<nums.count {
        if nums[nextNonDuplicate - 1] == nums[index] {
            nums[nextNonDuplicate] = nums[index]
            nextNonDuplicate += 1
        }
    }
    
    return nextNonDuplicate
}

/*
 977. 有序数组的平方
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。
 */
func sortedSquares(_ A: [Int]) -> [Int] {
    var result = [Int](repeating: 0, count: A.count)
    
    var left = A.startIndex
    var right = A.endIndex - 1
    var index = A.count - 1
    while left <= right {
        if (abs(A[left]) >= abs(A[right])) {
            result[index] = A[left] * A[left]
            left += 1
        } else {
            result[index] = A[right] * A[right]
            right -= 1
        }
        index -= 1
    }
    
    return result
}

/*
 713. 乘积小于K的子数组
 给定一个正整数数组 nums。
 找出该数组内乘积小于 k 的连续的子数组的个数。
 left...right 是以right 为结束的最长的乘积小于k 的子串，这样只要O(N) 的时间复杂度
 */
func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    
    var product = 1
    var left = 0
    for right in 0..<nums.count {
        product *= nums[right]
        while product >= k && left <= right {
            product /= nums[left]
            left += 1
        }
        if left <= right {
            result += (right - left + 1)
        }
    }
    
    return result
}

/*
 荷兰国旗问题 —— 中难
 Given an array containing 0s, 1s and 2s, sort the array in-place.
 You should treat numbers of the array as objects, hence, we can’t count 0s, 1s, and 2s to recreate the array.
 两个指针low和high, 把所有的0都交换到low，这样low以前的都是0，把所有的2都交换到high，这样以后的都是2，中间的就是1
 */
func dutchFlag(arr: inout [Int]) {
    var low = 0
    var high = arr.count - 1
    var i = 0
    while i <= high {
        if arr[i] == 0 {
            mySwap(arr: &arr, i, low)
            low += 1
            i += 1
        } else if arr[i] == 2 {
            mySwap(arr: &arr, i, high)
            high -= 1
        } else {
            i += 1
        }
    }
}

func mySwap(arr: inout [Int], _ i: Int, _ j: Int) {
    guard i != j else {
        return
    }
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
}

/*
 844. 比较含退格的字符串
 给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。
 注意：如果对空文本输入退格字符，文本继续为空。
 思路：逆向比较，由于Swift的String的index不能减到负的，导致最后第一个位置的比较写到我恶心，还是第二种堆栈方法好一些
 */
func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var sBack = 0
    var tBack = 0
    
    var si = S.endIndex
    var ti = T.endIndex
    
    let backspace = Character("#")
    
    while si > S.startIndex && ti > T.startIndex {
        si = S.index(before: si)
        ti = T.index(before: ti)
        
        while (S[si] == backspace || sBack > 0) && si > S.startIndex {
            if S[si] == backspace {
                sBack += 1
            } else {
                sBack -= 1
            }
            si = S.index(before: si)
        }
        
        while (T[ti] == backspace || tBack > 0) && ti > T.startIndex {
            if T[ti] == backspace {
                tBack += 1
            } else {
                tBack -= 1
            }
            ti = T.index(before: ti)
        }
        
        if si > S.startIndex && ti > T.startIndex {
            if S[si] != T[ti] {
                return false
            }
        }
    }
    
    if si == S.startIndex && ti == T.startIndex {
        if S[si] == backspace {
            sBack += 1
        }
        if T[ti] == backspace {
            tBack += 1
        }
        if sBack > 0 && tBack > 0 {
            return true
        } else if sBack > 0 || tBack > 0{
            return false
        } else {
            return S[si] == T[ti]
        }
    }
    if si == S.startIndex {
        if S[si] == backspace || sBack > 0 || S[si] != T[ti] {
            return false
        }
        ti = T.index(before: ti)
        
        while (T[ti] == backspace || tBack > 0) && ti > T.startIndex {
            if T[ti] == backspace {
                tBack += 1
            } else {
                tBack -= 1
            }
            ti = T.index(before: ti)
        }
        if ti > T.startIndex {
            return false
        }
        if T[ti] == backspace || tBack > 0 {
            return true
        }
        return false
    }
    
    if ti == T.startIndex {
        if T[ti] == backspace || tBack > 0 || S[si] != T[ti] {
            return false
        }
        si = S.index(before: si)
        
        while (S[si] == backspace || sBack > 0) && si > S.startIndex {
            if S[si] == backspace {
                sBack += 1
            } else {
                sBack -= 1
            }
            si = S.index(before: si)
        }
        if si > S.startIndex {
            return false
        }
        if S[si] == backspace || sBack > 0 {
            return true
        }
        return false
    }
    
    return true
}

// 比较退格字符串的堆栈法，比较清爽一点
func backspaceCompare2(_ S: String, _ T: String) -> Bool {
    return build(S) == build(T)
}

func build(_ string: String) -> String {
    var s = ""
    for i in string {
        if i == "#" {
            let _ = s.popLast()
        } else {
            s.append(i)
        }
    }
    return s
}

/*
 Minimum Window Sort (medium) #
 Given an array,
 find the length of the smallest subarray in it which when sorted will sort the whole array.
 */
func shortesWindowSort(arr: [Int]) -> Int {
    var left = 0
    var right = arr.count - 1
    
    // 找出左边不满足排序的left
    while left < arr.count - 1 && arr[left] <= arr[left + 1] {
        left += 1
    }
    
    // 已排序
    if left == arr.count - 1 {
        return 0
    }
    
    // 找出右边不满足排序的right
    while right > 0 && arr[right] >= arr[right - 1] {
        right -= 1
    }
    
    // 找出left...right 里的最小值和最大值
    var lowestInWindow = arr[left]
    var highestInWindow = arr[left]
    var i = left + 1
    while i <= right {
        if arr[i] < lowestInWindow {
            lowestInWindow = arr[i]
        } else if (arr[i] > highestInWindow) {
            highestInWindow = arr[i]
        }
        i += 1
    }
    
    // 往前扩展
    while lowestInWindow < arr[left - 1] && left > 0 {
        left -= 1
    }
    
    // 往后扩展
    while highestInWindow > arr[right + 1] && right < arr.count - 1 {
        right += 1
    }
    
    return right - left + 1
}
