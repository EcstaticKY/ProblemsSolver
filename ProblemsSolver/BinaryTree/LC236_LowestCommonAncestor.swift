///
/// Created by Zheng Kanyan on 2022/10/8.
/// 
///

import Foundation

func lowestCommonAncestorForNonBST(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    if let path = findPath(from: root, for: p) {
        for node in path.reversed() {
            if let _ = findPath(from: node, for: q) {
                return node
            }
        }
    }
    return nil
}

func findPath(from root: TreeNode?, for p: TreeNode?) -> [TreeNode]? {
    guard let root = root, let p = p else { return nil }
    
    guard root.val != p.val else { return [p] }
    
    if let path = findPath(from: root.left, for: p) {
        return [root] + path
    }
    if let path = findPath(from: root.right, for: p) {
        return [root] + path
    }
    return nil
}

func lowestCommonAncestorForNonBST2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    findNode(root, for: p, and: q)
}

func findNode(_ root: TreeNode?, for p: TreeNode?, and q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else { return nil }
    
    guard root.val != p.val && root.val != q.val else {
        return root
    }
    
    let leftFinded = findNode(root.left, for: p, and: q)
    let rightFinded = findNode(root.right, for: p, and: q)
    
    guard leftFinded != nil || rightFinded != nil else { return nil }
    guard leftFinded == nil || rightFinded == nil else { return root }
    return leftFinded == nil ? root.right : root.left
}
