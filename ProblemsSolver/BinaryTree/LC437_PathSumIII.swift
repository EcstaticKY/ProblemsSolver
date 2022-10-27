///
/// Created by Zheng Kanyan on 2022/10/8.
/// 
///

import Foundation

func pathSum3(_ root: TreeNode?, _ targetSum: Int) -> Int {
    guard let root = root else { return 0 }
    
    var sum = findPath(root, targetSum)
    
    if let left = root.left {
        sum += pathSum3(left, targetSum)
    }
    if let right = root.right {
        sum += pathSum3(right, targetSum)
    }
    
    return sum
}

func findPath(_ root: TreeNode?, _ targetSum: Int) -> Int {
    guard let root = root else { return 0 }
    
    var pathSum = 0
    if root.val == targetSum {
        pathSum += 1
    }
    
    if let left = root.left {
        pathSum += findPath(left, targetSum - root.val)
    }
    if let right = root.right {
        pathSum += findPath(right, targetSum - root.val)
    }
    
    return pathSum
}
