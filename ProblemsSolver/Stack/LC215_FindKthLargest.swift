///
/// Created by Zheng Kanyan on 2022/10/4.
/// 
///

import Foundation

func FindKthLargestWithPartition(_ nums: [Int], _ k: Int) -> Int {
    guard k > 0 && nums.count >= k else { return -1 }
    
    var mutatingNums = nums
    
    var startIndex = 0
    var endIndex = mutatingNums.count - 1
    while true {
        let curIndex = partition(&mutatingNums, start: startIndex, end: endIndex)
        
        guard curIndex != k - 1 else { return mutatingNums[curIndex] }
        
        if curIndex < k - 1 {
            startIndex = curIndex + 1
        } else {
            endIndex = curIndex - 1
        }
    }
}

private func partition(_ nums: inout [Int], start: Int, end: Int) -> Int {
    nums.swapAt(Int.random(in: start...end), end)
    let pivot = nums[end]
    var curIndex = start
    for index in start...end {
        if nums[index] > pivot {
            nums.swapAt(index, curIndex)
            curIndex += 1
        }
    }
    if curIndex != end {
        nums.swapAt(curIndex, end)
    }
    return curIndex
}

func FindKthLargestWithHeap(_ nums: [Int], _ k: Int) -> Int {
    // 初始化一个最小堆
    var heap = Heap<Int>(comparator: >)
    
    nums.forEach { num in
        if heap.length < k {
            heap.add(num)
        } else {
            if heap.peek()! < num {
                heap.replace(num)
            }
        }
    }
    
    return heap.poll()!
}
