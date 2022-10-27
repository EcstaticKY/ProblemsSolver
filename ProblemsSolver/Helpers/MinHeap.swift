///
/// Created by Zheng Kanyan on 2022/10/4.
/// 
///

import Foundation

public struct MinHeap {
    private var data: [Int]
    
    public init() {
        self.data = [Int]()
    }
    
    public var length: Int {
        data.count
    }
    
    public func toString() -> String {
        data.description
    }
    
    public func peek() -> Int? {
        data.first
    }
    
    public mutating func poll() -> Int? {
        guard !data.isEmpty else { return nil }
        guard data.count > 1 else { return data.popLast()! }
        
        let item = data.first!
        data[0] = data.popLast()!
        heapifyDown()
        
        return item
    }
    
    public mutating func add(_ item: Int) {
        data.append(item)
        heapifyUp()
    }
    
    private mutating func heapifyDown() {
        var curIndex = 0
        while let leftChildIndex = leftChildIndex(at: curIndex) {
            var smallerChildIndex = leftChildIndex
            if let rightChildIndex = rightChildIndex(at: curIndex),
                data[rightChildIndex] < data[leftChildIndex] {
                smallerChildIndex = rightChildIndex
            }
            guard data[smallerChildIndex] < data[curIndex] else { break }
            swap(at: curIndex, with: smallerChildIndex)
            curIndex = smallerChildIndex
        }
    }
    
    private mutating func heapifyUp() {
        var curIndex = data.count - 1
        while let parentIndex = parentIndex(at: curIndex),
                data[parentIndex] > data[curIndex] {
            swap(at: parentIndex, with: curIndex)
            curIndex = parentIndex
        }
    }
    
    private func parentIndex(at childIndex: Int) -> Int? {
        guard childIndex > 0 else { return nil }
        return (childIndex - 1) / 2
    }
    
    private func leftChildIndex(at parentIndex: Int) -> Int? {
        let leftChildIndex = parentIndex * 2 + 1
        guard leftChildIndex < data.count else { return nil }
        return leftChildIndex
    }
    
    private func rightChildIndex(at parentIndex: Int) -> Int? {
        let rightChildIndex = parentIndex * 2 + 2
        guard rightChildIndex < data.count else { return nil }
        return rightChildIndex
    }
    
    private mutating func swap(at index1: Int, with index2: Int) {
        let temp = data[index1]
        data[index1] = data[index2]
        data[index2] = temp
    }
}
