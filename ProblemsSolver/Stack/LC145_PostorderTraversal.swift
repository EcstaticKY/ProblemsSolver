///
/// Created by Zheng Kanyan on 2022/9/27.
/// 
///

import Foundation

func PostorderTraversal(_ root: TreeNode?) -> [Int] {
    var ret = [Int]()
    
    guard let root = root else { return ret }
    ret.append(contentsOf: PostorderTraversal(root.left))
    ret.append(contentsOf: PostorderTraversal(root.right))
    ret.append(root.val)
    
    return ret
}

func PostorderTraversalWithoutRecursion(_ root: TreeNode?) -> [Int] {
    var ret = [Int]()
    guard let root = root else { return ret }
    var stack = [root]
    var pre = root
    
    while !stack.isEmpty {
        let cur = stack.last!
        if (cur.left == nil && cur.right == nil) || pre === cur.left || pre === cur.right {
            pre = stack.popLast()!
            ret.append(cur.val)
        } else {
            if let right = cur.right {
                stack.append(right)
            }
            if let left = cur.left {
                stack.append(left)
            }
        }
    }
    
    return ret
}

func PostorderTraversalWithoutRecursion2(_ root: TreeNode?) -> [Int] {
    var ret = [Int]()
    guard let root = root else { return ret }
    var stack = [Operation(command: .go, node: root)]
    
    while let cur = stack.popLast() {
        if cur.command == .print {
            ret.append(cur.node.val)
        } else {
            stack.append(Operation(command: .print, node: cur.node))
            if let right = cur.node.right {
                stack.append(Operation(command: .go, node: right))
            }
            if let left = cur.node.left {
                stack.append(Operation(command: .go, node: left))
            }
        }
    }
    
    return ret
}

private struct Operation {
    enum Command {
        case go
        case print
    }
    
    let command: Command
    let node: TreeNode
}
