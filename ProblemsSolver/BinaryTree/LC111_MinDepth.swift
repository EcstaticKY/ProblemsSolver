///
/// Created by Zheng Kanyan on 2022/10/5.
/// 
///

import Foundation

// 递归方法
func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let leftMinDepth = minDepth(root.left)
    let rightMinDepth = minDepth(root.right)
    
    if leftMinDepth == 0 {
        return rightMinDepth + 1
    } else if rightMinDepth == 0 {
        return leftMinDepth + 1
    } else {
        return min(leftMinDepth, rightMinDepth) + 1
    }
}

// 队列方法
func minDepthWithQueue(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var queue = [root]
    var depth = 1
    while true {
        let curLayerCount = queue.count
        for i in 0..<curLayerCount {
            let curNode = queue[i]
            if curNode.left == nil && curNode.right == nil {
                return depth
            }
            if let left = curNode.left {
                queue.append(left)
            }
            if let right = curNode.right {
                queue.append(right)
            }
        }
        queue.removeFirst(curLayerCount)
        depth += 1
    }
}
