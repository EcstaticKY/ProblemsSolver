///
/// Created by Zheng Kanyan on 2022/10/3.
/// 
///

import Foundation

func TopKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    nums.reduce(into: [:]) { partialResult, num in
        partialResult[num, default: 0] += 1
    }.sorted { $0.value > $1.value }.prefix(k).map { $0.key }
}

/// 还可以桶排序
func TopKFrequentWithHeap(_ nums: [Int], _ k: Int) -> [Int] {
    
    var frequents = [Int: Int]()
    nums.forEach {
        frequents[$0] = frequents[$0] == nil ? 1 : frequents[$0]! + 1
    }
    
    // 构造一个最小堆
    var heap = Heap<(key: Int, value: Int)> { frequent1, frequent2 in
        frequent1.value > frequent2.value
    }
    
    frequents.forEach { frequnt in
        heap.add(frequnt)
        if heap.length > k {
            heap.poll()
        }
    }
    
    var ret = [Int]()
    while let frequent = heap.poll() {
        ret.append(frequent.key)
    }
    
    return ret.reversed()
}
