///
/// Created by Zheng Kanyan on 2022/10/10.
/// 
///

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    combinations(candidates, 0, target)
}

private func combinations(_ candidates: [Int], _ start: Int, _ target: Int) -> [[Int]] {
    let base = candidates[start]
    var times = 0
    var part = 0
    
    var ret = [[Int]]()
    while part <= target {
        guard part != target else {
            ret += [Array(repeating: base, count: times)]
            break
        }
        
        if start < candidates.count - 1 {
            let combinations = combinations(candidates, start + 1, target - part)
            if !combinations.isEmpty {
                ret += times > 0 ? combinations.map { Array(repeating: base, count: times) + $0 } : combinations
            }
        }
        
        times += 1
        part += base
    }
    
    return ret
}
