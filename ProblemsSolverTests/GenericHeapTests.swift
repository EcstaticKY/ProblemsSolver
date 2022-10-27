///
/// Created by Zheng Kanyan on 2022/10/4.
/// 
///

import Foundation

import XCTest
import ProblemsSolver

final class GenericHeapTests: XCTestCase {

    func test_addAndPoll() throws {
        var minHeap = Heap<Int>(comparator: >)
        
        minHeap.add(2)
        minHeap.add(10)
        minHeap.add(8)
        minHeap.add(9)
        minHeap.add(7)
        minHeap.add(3)
        minHeap.add(4)

        print("MinHeap: \(minHeap.toString())")
        XCTAssertEqual(dump(&minHeap), [2, 3, 4, 7, 8, 9, 10])
    }
    
    private func dump(_ minHeap: inout Heap<Int>) -> [Int] {
        var ret = [Int]()
        while let next = minHeap.poll() {
            ret.append(next)
        }
        return ret
    }
}
