///
/// Created by Zheng Kanyan on 2022/10/4.
/// 
///

import XCTest
import ProblemsSolver

final class MinHeapTests: XCTestCase {

    func test_addAndPoll() throws {
        var minHeap = MinHeap()
        
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
    
    private func dump(_ minHeap: inout MinHeap) -> [Int] {
        var ret = [Int]()
        while let next = minHeap.poll() {
            ret.append(next)
        }
        return ret
    }
}
