///
/// Created by Zheng Kanyan on 2022/10/10.
/// 
///

import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidatesWithCount = candidates.reduce(into: [:]) { partialResult, candidate in
        partialResult[candidate, default: 0] += 1
    }.map { ($0, $1) }
    
    return combinations(candidatesWithCount, 0, target)
}

private func combinations(_ candidates: [(val: Int, count: Int)],
                           _ start: Int, _ target: Int) -> [[Int]] {
    let base = candidates[start].val
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
        
        if times < candidates[start].count {
            times += 1
            part += base
        } else {
            break
        }
    }
    
    return ret
}
