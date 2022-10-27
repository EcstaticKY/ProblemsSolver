///
/// Created by Zheng Kanyan on 2022/10/10.
/// 
///

import Foundation

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let numsWithCount = nums.reduce(into: [:]) { partialResult, num in
        partialResult[num, default: 0] += 1
    }.map { ($0, $1) }
    
    var ret: [[Int]] = [[]]
    
    for i in 1...nums.count {
        ret += subsets(numsWithCount, 0, i)
    }
    
    return ret
}

private func subsets(_ numsWithCount: [(val: Int, count: Int)], _ start: Int, _ k: Int) -> [[Int]] {
    guard start < numsWithCount.count else { return [[Int]]() }
    
    let cur = numsWithCount[start]
    let maxRepeatingCount = min(cur.count, k)
    
    var ret = [[Int]]()
    for i in 0...maxRepeatingCount {
        if k == i {
            ret += [Array(repeating: cur.val, count: i)]
        } else {
            let subsets = subsets(numsWithCount, start + 1, k - i)
            ret += i > 0 ? subsets.map { Array(repeating: cur.val, count: i) + $0 } : subsets
        }
    }
    
    return ret
}
