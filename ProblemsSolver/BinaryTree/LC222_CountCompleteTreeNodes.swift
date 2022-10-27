///
/// Created by Zheng Kanyan on 2022/10/5.
/// 
///

import Foundation

func countNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var count = 1
    count += countNodes(root.left)
    count += countNodes(root.right)
    
    return count
}

func countNodesWithLevelTraversal(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var count = 0
    var stack = [root]
    while let cur = stack.popLast() {
        count += 1
        if let left = cur.left {
            stack.insert(left, at: 0)
            if let right = cur.right {
                stack.insert(right, at: 0)
            }
        }
    }
    return count
}

// 深度优先 + 二分搜索
func countNodesForCompleteBinaryTree(_ root: TreeNode?) -> Int {
    
    guard root != nil else { return 0 }
    
    var cur = root
    var stack = [TreeNode]()
    while let node = cur {
        stack.append(node)
        cur = node.left
    }
    let level = stack.count - 1
    let count = 1 << level
    
    var low = 0
    var high = count - 1
    
    while low != high {
        let middle = high - low == 1 ? high : (low + high) / 2
        if hasNode(index: middle, stack: stack) {
            low = middle
        } else {
            high = middle - 1
        }
    }
    
    return count + low
}

private func hasNode(index: Int, stack: [TreeNode]) -> Bool {
    let level = stack.count - 1
    var curLvl = level - 1
    while index & (1 << curLvl) == 0 {
        curLvl -= 1
    }
    var node = stack[level - curLvl - 1].right
    while node != nil && curLvl > 0 {
        curLvl -= 1
        if index & (1 << curLvl) == 0 {
            node = node?.left
        } else {
            node = node?.right
        }
    }
    
    return node != nil
}


func countNodesWithBestRecursion(_ root: TreeNode?) -> Int {
    return countNodesWithBestRecursion(root, nodeDepth(root))
}
//通过lh将计算高度传递,避免一次左子树的重复计算
func countNodesWithBestRecursion(_ root: TreeNode?, _ lh: Int) -> Int {
    if root == nil {
        return 0
    }
    let lh = lh - 1 //左子树高度
    let lr = nodeDepth(root!.right) //右子树高度
    if (lh == lr) { //左子树为完全二叉树
        return (1 << lh) + countNodesWithBestRecursion(root!.right , lr) //左子树个数 + 递归右子树个数
    } else { //右子树为完全二叉树
        return (1 << lr) + countNodesWithBestRecursion(root!.left , lh) //右子树个数 + 递归左子树个数
    }
}

func nodeDepth(_ node: TreeNode?) -> Int {
    var height = 0
    var n = node
    while n != nil {
        height += 1
        n = n!.left
    }
    return height
}
