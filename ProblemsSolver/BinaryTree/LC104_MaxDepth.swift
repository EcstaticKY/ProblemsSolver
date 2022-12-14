///
/// Created by Zheng Kanyan on 2022/10/5.
/// 
///

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}
