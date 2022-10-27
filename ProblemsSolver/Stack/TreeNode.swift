///
/// Created by Zheng Kanyan on 2022/9/27.
/// 
///

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public init(_ vals: [Int?]) {
        self.val = vals[0]!
        var queue: [TreeNode] = [self]
        
        var index = 1
        while index < vals.count {
            let parent = queue.removeFirst()
            if let val = vals[index] {
                let node = TreeNode(val)
                parent.left = node
                queue.append(node)
            }
            index += 1
            guard index < vals.count else { break }
            if let val = vals[index] {
                let node = TreeNode(val)
                parent.right = node
                queue.append(node)
            }
            index += 1
        }
    }
}
