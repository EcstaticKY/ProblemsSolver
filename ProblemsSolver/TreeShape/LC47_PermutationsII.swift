///
/// Created by Zheng Kanyan on 2022/10/9.
/// 
///

import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var nums = nums
    return permutation(&nums)
}

private func permutation(_ nums: inout [Int]) -> [[Int]] {
    guard nums.count > 1 else { return [nums] }
    
    var ret = [[Int]]()
    for i in nums.indices {
        guard nums.firstIndex(of: nums[i]) == i else { continue }
        let cur = nums.remove(at: i)
        let perms = permutation(&nums)
        ret += perms.map { [cur] + $0 }
        
        nums.insert(cur, at: i)
    }
    
    return ret
}
