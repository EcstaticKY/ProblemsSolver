///
/// Created by Zheng Kanyan on 2022/10/1.
/// 
///

import Foundation

func LevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [[Int]]() }
    var stack = [root]
    var currentLayerCount = 1
    var nextLayerCount = 0
    var ret = [[Int]]()
    var currentLayer = [Int]()
    
    while let cur = stack.popLast() {
        currentLayer.append(cur.val)
        if currentLayer.count == currentLayerCount {
            ret.append(currentLayer)
            currentLayerCount = 0
            currentLayer = [Int]()
        }
        if let left = cur.left {
            stack.insert(left, at: 0)
            nextLayerCount += 1
        }
        if let right = cur.right {
            stack.insert(right, at: 0)
            nextLayerCount += 1
        }
        if currentLayerCount == 0 {
            currentLayerCount = nextLayerCount
            nextLayerCount = 0
        }
    }
    
    return ret
}

func LevelOrder2(_ root: TreeNode?) -> [[Int]] {
    var ret = [[Int]]()
    
    guard let root = root else { return ret }
    var stack: [(node: TreeNode, lvl: Int)] = [(root, 0)]
    
    while let cur = stack.popLast() {
        let curLvl = cur.lvl
        if curLvl == ret.count {
            ret.append([Int]())
        }
        ret[curLvl].append(cur.node.val)
        
        if let left = cur.node.left {
            stack.insert((left, curLvl + 1), at: 0)
        }
        if let right = cur.node.right {
            stack.insert((right, curLvl + 1), at: 0)
        }
    }
    
    return ret
}
