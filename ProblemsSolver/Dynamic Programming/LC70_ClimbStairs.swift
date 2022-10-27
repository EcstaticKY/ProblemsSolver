///
/// Created by Zheng Kanyan on 2022/10/12.
/// 
///

import Foundation

func climbStairs(_ n: Int) -> Int {
    guard n > 1 else { return 1 }
    
    var memo = [1, 1]
    
    for i in 2...n {
        memo.append(memo[i - 1] + memo[i - 2])
    }
    
    return memo.last!
}
