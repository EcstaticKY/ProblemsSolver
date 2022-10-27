///
/// Created by Zheng Kanyan on 2022/10/9.
/// 
///

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    guard k < n else {
        return [Array(1...k)]
    }
    
    guard k > 1 else {
        return (1...n).map { [$0] }
    }
    
    return (k...n).flatMap { num in
        combine(num - 1, k - 1).map {
            [num] + $0
        }
    }
}
