///
/// Created by Zheng Kanyan on 2022/10/7.
/// 
///

import Foundation

func sumNumbers(_ root: TreeNode?) -> Int {
    paths(root).reduce(0) { partialResult, path in
        partialResult + path.enumerated().reduce(0) { partialResult, element in
            partialResult + element.1 * pow(10, (path.count - element.0 - 1))
        }
    }
}

private func paths(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [[Int]]() }
    
    guard root.left != nil || root.right != nil else { return [[root.val]] }
    
    var ret = [[Int]]()
    if let left = root.left {
        ret += paths(left).map { [root.val] + $0 }
    }
    if let right = root.right {
        ret += paths(right).map { [root.val] + $0 }
    }
    
    return ret
}
