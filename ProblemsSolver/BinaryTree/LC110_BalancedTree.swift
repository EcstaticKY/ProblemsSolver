///
/// Created by Zheng Kanyan on 2022/10/6.
/// 
///

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    guard isBalanced(root.left) && isBalanced(root.right) else {
        return false
    }
    
    let leftDepth = maxDepth(root.left)
    let rightDepth = maxDepth(root.right)
    
    guard abs(leftDepth - rightDepth) <= 1 else {
        return false
    }
    return true
}

func isBalanced2(_ root: TreeNode?) -> Bool {
    return isBalancedWithDepth(root) != -1
}

func isBalancedWithDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    let leftDepth = isBalancedWithDepth(root.left)
    guard leftDepth != -1 else { return -1 }
    
    let rightDepth = isBalancedWithDepth(root.right)
    guard rightDepth != -1 else { return -1 }
    
    guard abs(leftDepth - rightDepth) <= 1 else { return -1 }
    return max(leftDepth, rightDepth) + 1
}


