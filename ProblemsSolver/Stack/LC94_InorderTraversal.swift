///
/// Created by Zheng Kanyan on 2022/9/27.
/// 
///

import Foundation

func InorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [Int]() }
    
    var ret = [Int]()
    ret.append(contentsOf: InorderTraversal(root.left))
    ret.append(root.val)
    ret.append(contentsOf: InorderTraversal(root.right))
    
    return ret
}

func InorderTraversalWithoutRecursion(_ root: TreeNode?) -> [Int] {
    var stack = [TreeNode]()
    var ret = [Int]()
    var node = root
    
    while let cur = node {
        stack.append(cur)
        node = cur.left
    }
    
    while let cur = stack.popLast() {
        ret.append(cur.val)
        node = cur.right
        while let cur = node {
            stack.append(cur)
            node = cur.left
        }
    }
    
    return ret
}

