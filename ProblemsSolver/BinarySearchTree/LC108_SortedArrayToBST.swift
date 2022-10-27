///
/// Created by Zheng Kanyan on 2022/10/8.
/// 
///

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard !nums.isEmpty else { return nil }
    
    let middle = nums.count / 2
    let root = TreeNode(nums[middle])
    
    if middle - 0 > 0 {
        root.left = sortedArrayToBST(Array(nums[0..<middle]))
    }
    if middle < nums.count - 1 {
        root.right = sortedArrayToBST(Array(nums[(middle+1)..<nums.count]))
    }
    
    return root
}
