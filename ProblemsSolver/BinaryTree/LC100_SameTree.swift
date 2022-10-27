///
/// Created by Zheng Kanyan on 2022/10/5.
/// 
///

import Foundation

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard p != nil || q != nil else { return true }
    guard let p = p, let q = q, p.val == q.val else { return false }
    return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}
