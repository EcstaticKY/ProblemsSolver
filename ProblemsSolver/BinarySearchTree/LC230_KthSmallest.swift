///
/// Created by Zheng Kanyan on 2022/10/8.
/// 
///

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root = root else { return -1 }
    
    var stack = [Operation(command: .go, node: root)]
    var count = 0
    
    while let cur = stack.popLast() {
        if cur.command == .count {
            count += 1
            guard count != k else { return cur.node.val }
        } else {
            if let right = cur.node.right {
                stack.append(Operation(command: .go, node: right))
            }
            stack.append(Operation(command: .count, node: cur.node))
            if let left = cur.node.left {
                stack.append(Operation(command: .go, node: left))
            }
        }
    }
    
    return -1
}

private struct Operation {
    enum Command {
        case go
        case count
    }
    
    let command: Command
    let node: TreeNode
}
