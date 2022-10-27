///
/// Created by Zheng Kanyan on 2022/10/5.
/// 
///

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    return symmetricBetween(root.left, root.right)
}

private func symmetricBetween(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
    guard leftNode != nil || rightNode != nil else { return true }
    guard let leftNode = leftNode,
            let rightNode = rightNode,
            leftNode.val == rightNode.val else {
        return false
    }
    
    return symmetricBetween(leftNode.left, rightNode.right)
        && symmetricBetween(leftNode.right, rightNode.left)
}
