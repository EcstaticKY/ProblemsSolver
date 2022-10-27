///
/// Created by Zheng Kanyan on 2022/10/8.
/// 
///

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return false }
    return validateBST(root)
}

private func validateBST(_ root: TreeNode, lowest: Int? = nil, highest: Int? = nil) -> Bool {
    if let low = lowest {
        guard root.val > low else { return false }
    }
    if let high = highest {
        guard root.val < high else { return false }
    }
    
    var ret = true
    if let left = root.left {
        ret = ret && validateBST(left, lowest: lowest, highest: root.val)
    }
    if let right = root.right {
        ret = ret && validateBST(right, lowest: root.val, highest: highest)
    }
    
    return ret
}
