///
/// Created by Zheng Kanyan on 2022/9/24.
///

import Foundation

public class ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public init(_ vals: [Int]) throws {
        guard !vals.isEmpty else {
            throw NSError(domain: "ListNode init error", code: 0)
        }
        self.val = vals.first!
        var cur = self
        for i in 1..<vals.count {
            let newNode = ListNode(vals[i])
            cur.next = newNode
            cur = newNode
        }
    }
    
    public func toString() -> String {
        var result = "["
        var cur: ListNode? = self
        while cur != nil {
            result += "\(cur!.val), "
            cur = cur!.next
        }
        result += "nil]"
        return result
    }
}
