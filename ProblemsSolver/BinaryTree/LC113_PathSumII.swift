///
/// Created by Zheng Kanyan on 2022/10/7.
/// 
///

import Foundation

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    
    var ret = [[Int]]()
    guard let root = root else { return ret }
    
    if root.left == nil && root.right == nil {
        guard root.val != targetSum else { return [[targetSum]] }
        return ret
    }
    
    if let left = root.left {
        ret += pathSum(left, targetSum - root.val).map({
            [root.val] + $0
        })
    }
    if let right = root.right {
        ret += pathSum(right, targetSum - root.val).map({
            [root.val] + $0
        })
    }
    
    return ret
}
