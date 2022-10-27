///
/// Created by Zheng Kanyan on 2022/10/5.
/// 
///

import Foundation

@discardableResult
func InvertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    InvertTree(root.left)
    InvertTree(root.right)
    swap(&root.left, &root.right)
    
    return root
}
