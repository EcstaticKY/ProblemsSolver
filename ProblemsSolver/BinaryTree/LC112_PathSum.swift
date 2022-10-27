///
/// Created by Zheng Kanyan on 2022/10/6.
/// 
///

import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }
    
    if root.left == nil && root.right == nil {
        guard root.val != targetSum else { return true }
        return false
    }
    
    return hasPathSum(root.left, targetSum - root.val)
        || hasPathSum(root.right, targetSum - root.val)
}
