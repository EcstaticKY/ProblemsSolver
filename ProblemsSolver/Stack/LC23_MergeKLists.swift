///
/// Created by Zheng Kanyan on 2022/10/4.
/// 
///

import Foundation

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    
    var heap = Heap<ListNode> { node1, node2 in
        node1.val > node2.val
    }
    
    lists.forEach { if let node = $0 { heap.add(node) } }
    
    guard let ret = heap.poll() else { return nil }
    if let next = ret.next { heap.add(next) }
    
    var prev = ret
    while let cur = heap.poll() {
        prev.next = cur
        if let next = cur.next { heap.add(next) }
        prev = cur
    }
    
    return ret
}
