///
/// Created by Zheng Kanyan on 2022/10/11.
/// 
///

import Foundation

func fib_0(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    guard n > 1 else { return 1 }
    return fib_0(n - 1) + fib_0(n - 2)
}

func fib_1(_ n: Int) -> Int {
    var memo = [Int](repeating: -1, count: n + 1)
    return fib(n, &memo)
}

private func fib(_ n: Int, _ memo: inout [Int]) -> Int {
    guard n > 0 else { return 0 }
    guard n > 1 else { return 1 }
    
    guard memo[n] == -1 else { return memo[n] }
    
    memo[n] = fib(n - 1, &memo) + fib(n - 2, &memo)
    return memo[n]
}

func fib_2(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    guard n > 1 else { return 1 }
    
    var memo = [Int]()
    memo.append(contentsOf: [0, 1])
    
    for i in 2...n {
        memo.append(memo[i - 1] + memo[i - 2])
    }
    
    return memo.last!
}
