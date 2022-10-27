//
//  FastAndSlowPointers.swift
//  KAlgo
//
//  Created by Zheng Kanyan on 2020/8/24.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import Foundation

class FastAndSlowPointers {
    /**
    141. 环形链表
    给定一个链表，判断链表中是否有环。
    为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
    */
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow!.next
            if fast == slow {
                return true
            }
        }
        
        return false
    }
    
/**
142. 环形链表 II
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

 说明：不允许修改给定的链表。
 */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        var slow = head
        var fast = head?.next
        
        while slow != fast {
            if fast == nil {
                return nil
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // 说明有环, 接着slow不动，fast绕一圈，求出环的长度
        var length = 1
        fast = slow!.next
        while fast != slow {
            fast = fast!.next
            length += 1
        }
        
        // slow回到head, fast去 head+length的位置，两个一起走，碰到的位置就是环的起点
        slow = head
        fast = head
        for _ in 0..<length {
            fast = fast!.next
        }
        while fast != slow {
            slow = slow!.next
            fast = fast!.next
        }
        
        return slow
    }

    /**
     很棒的优化：不需要去算环的长度，第一遍slow和fast相遇点其实再走k步就是环的起始点，数学证明：
     假设环的起始点距离head为k, 环的长度为n；
     那么slow走k步走到环的起始点的时候，fast走的距离为2k，所在位置为 k+k%n；
     此时fast和slow的差距为 n-k%n，所以slow再走 n-k%n即能和fast相遇；
     他们此时所在的位置是环内的 n-k%n 这个点上，下面只要证明从这个点再走k步就能回到环的起始点即可
     (n-k%n+k)%n = (n%n - (k%n)%n + k%n)%n = (-k%n + k%n) %n = 0，证明完成啦
     */
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            
            if slow === fast {
                slow = head
                while slow !== fast {
                    slow = slow!.next
                    fast = fast!.next
                }
                return slow
            }
        }
        
        return nil
    }
    
/* 202. 快乐数
     和之前的题目差不多，要么hashmap, 要么构造linkedlist
 */
    func isHappy(_ n: Int) -> Bool {
        var dict = [n:1]
        var x = n
        while x != 1 {
            var new = 0
            while x > 0 {
                let remain = x % 10
                new += remain * remain
                x = x / 10
            }
            if let _ = dict[new] {
                return false
            }
            dict[new] = 1
            x = new
            new = 0
        }
        return true
    }
    
    func isHappy2(_ n: Int) -> Bool {
        var slow = n
        var fast = n
        
        repeat {
            slow = findNextSum(slow)
            fast = findNextSum(findNextSum(fast))
        } while slow != fast
        
        return slow == 1
    }
    
    func findNextSum(_ num: Int) -> Int {
        var sum = 0
        var x = num
        while x > 0 {
            let remain = x % 10
            sum += remain * remain
            x = x / 10
        }
        return sum
    }

/*
     234. 回文链表
     请判断一个链表是否为回文链表。进阶：
     你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
     思路：
     先用快慢指针找到链表的中点，逆转后半链表，比较两边的链表是否相等
     */
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head?.next != nil else {
            return true
        }
        
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow!.next
            fast = fast!.next?.next
        }
        
        // 此时slow在正中间位置
        var prevOne: ListNode? = nil
        repeat {
            let temp = slow?.next
            slow?.next = prevOne
            prevOne  = slow
            slow = temp
        } while slow != nil
        
        if fast == nil {
            fast = prevOne
        }
        var right = fast    // 后续用于复原的节点，此乃链表的最后一个节点
        slow = head
        
        var result = true
        
        while slow !== fast && fast != nil {
            if slow?.val != fast?.val {
                result = false
                break
            }
            slow = slow?.next
            fast = fast?.next
        }
        
        // 把后半部分的链表复原回来
        prevOne = nil
        repeat {
            let temp = right?.next
            right?.next = prevOne
            prevOne = right
            right = temp
        } while right != nil
        
        return result
    }
    
    // 这是递归链表来判断是否回文的方法，很有意思
    func isPalindrome2(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        h = head
        _ = travesalListNode(head)
        
        return res
    }
    var h: ListNode?
    var res: Bool = true
    var total: Int = 0
    var c: Int = 0
    func travesalListNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        total += 1
        let node = travesalListNode(head.next)
        if node != nil && res && c < (total+1)/2 {
            c += 1
            if node!.val != h!.val {
                res = false
            } else {
                h = h?.next
            }
        }
        return head
    }
    
    /*
     143. 重排链表 (medium) #
     Given the head of a Singly LinkedList, write a method to modify the LinkedList such that the nodes from the second half of the LinkedList are inserted alternately to the nodes from the first half in reverse order. So if the LinkedList has nodes 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> null, your method should return 1 -> 6 -> 2 -> 5 -> 3 -> 4 -> null.

     Your algorithm should not use any extra space and the input LinkedList should be modified in-place.
     和上一题一样，两个方法，快慢指针/递归
     */
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var left = head
        var right = reversList(slow)
        while left != nil && right != nil {
            var temp = left?.next
            left?.next = right
            left = temp
            
            temp = right?.next
            right?.next = left
            right = temp
        }
        
        left?.next = nil
    }
    
    func reversList(_ node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var head = node
        repeat {
            let temp = head?.next
            head?.next = prev
            prev = head
            head = temp
        } while head != nil
        
        return prev
    }
    
    /*
     457. 环形数组循环
     给定一个含有正整数和负整数的环形数组 nums。 如果某个索引中的数 k 为正数，则向前移动 k 个索引。相反，如果是负数 (-k)，则向后移动 k 个索引。因为数组是环形的，所以可以假设最后一个元素的下一个元素是第一个元素，而第一个元素的前一个元素是最后一个元素。

     确定 nums 中是否存在循环（或周期）。循环必须在相同的索引处开始和结束并且循环长度 > 1。此外，一个循环中的所有运动都必须沿着同一方向进行。换句话说，一个循环中不能同时包括向前的运动和向后的运动。
     
     除了快慢指针，这道题还有一个深度优先的题解
     */
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        if nums.count <= 0 {
            return false
        }
        for i in 0..<nums.count-1 {
            let direction = nums[i] > 0
            var slow = i
            var fast = i
            repeat {
                slow = findingNextIndex(nums, slow)
                fast = findingNextIndex(nums, fast)
                if direction != (nums[fast] > 0) {
                    break
                }
                fast = findingNextIndex(nums, fast)
                if direction != (nums[fast] > 0) {
                    break
                }
            } while slow != fast
            if slow == fast && slow != findingNextIndex(nums, slow) && direction == (nums[slow] > 0) {
                return true
            }
        }
        return false
    }
    
    func findingNextIndex(_ nums: [Int], _ index: Int) -> Int {
        let newIndex = (index + nums[index]) % nums.count
        return newIndex >= 0 ? newIndex : newIndex + nums.count
    }
}
