//
//  LC86_PartitionLink.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/23.
//

import Foundation

func PartitionLinks(_ head: ListNode?, _ x: Int) -> ListNode? {
    let dummyHead = ListNode(x - 1)
    dummyHead.next = head
    var cur: ListNode? = dummyHead
    var lastSmaller: ListNode?
    
    while cur != nil && cur!.val < x {
        lastSmaller = cur
        cur = cur?.next
    }
    let firstLarger = cur
    
    while cur != nil {
        while cur!.next != nil && cur!.next!.val >= x {
            cur = cur?.next
        }
        
        if let lastLarger = cur, let next = lastLarger.next {
            lastSmaller?.next = next
            lastSmaller = next
            lastLarger.next = next.next
            next.next = firstLarger
        }
        
        if (cur!.next == nil) {
            break
        }
    }
    
    return dummyHead.next
}
