///
/// Created by Zheng Kanyan on 2022/10/9.
/// 
///

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var nums = nums
    return permutation(&nums)
}

private func permutation(_ nums: inout [Int]) -> [[Int]] {
    guard nums.count > 1 else { return [nums] }
    
    var ret = [[Int]]()
    
    for i in nums.indices {
        let cur = nums.remove(at: i)
        let perm = permutation(&nums)
        ret += perm.map { [cur] + $0 }
        
        nums.insert(cur, at: i)
    }
    
    return ret
}
