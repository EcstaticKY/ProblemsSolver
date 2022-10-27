//
//  LC92_ReversedLinkList.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/21.
//

import Foundation

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    guard left < right else { return head }
    guard head != nil else { return head }
    
    var prev = head
    var cur = head
    var curIndex = 1
    while cur != nil && curIndex < left {
        curIndex += 1
        prev = cur
        cur = cur?.next
    }
    
    let beforeStart: ListNode? = (prev === cur) ? nil : prev
    let start = cur
    while cur != nil && curIndex <= right {
        curIndex += 1
        let next = cur?.next
        cur?.next = prev
        prev = cur
        cur = next
    }
    start?.next = cur
    if let beforeStart = beforeStart {
        beforeStart.next = prev
    } else {
        return prev
    }
    
    return head
}


