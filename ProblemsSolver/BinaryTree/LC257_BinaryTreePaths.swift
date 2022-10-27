///
/// Created by Zheng Kanyan on 2022/10/7.
/// 
///

import Foundation

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    binaryTreePaths2(root).map{ $0.reduce(into: "") { partialResult, num in
        if !partialResult.isEmpty {
            partialResult.append("->")
        }
        partialResult.append("\(num)")
    } }
}

func binaryTreePaths2(_ root: TreeNode?) -> [[Int]] {
    var paths = [[Int]]()
    
    guard let root = root else { return paths }
    guard root.left != nil || root.right != nil else { return [[root.val]] }
    if let left = root.left {
        paths += binaryTreePaths2(left).map { path in
            [root.val] + path
        }
    }
    if let right = root.right {
        paths += binaryTreePaths2(right).map { path in
            [root.val] + path
        }
    }
    
    return paths
}
