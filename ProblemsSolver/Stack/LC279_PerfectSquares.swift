///
/// Created by Zheng Kanyan on 2022/10/1.
/// 
///

import Foundation

func NumSquares(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    
    var stack = [(num: Int, lvl: Int)]()
    stack.append((n, 0))
    var visited = Set<Int>()
    
    while let cur = stack.popLast() {
        var i = 1
        while true {
            let a = i * i
            guard a <= cur.num else { break }
            guard a < cur.num else { return cur.lvl + 1 }
            let num = cur.num - a
            if !visited.contains(num) {
                stack.insert((num, cur.lvl + 1), at: 0)
                visited.insert(num)
            }
            i += 1
        }
    }
    
    return 0
}
