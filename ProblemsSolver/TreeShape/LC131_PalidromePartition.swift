///
/// Created by Zheng Kanyan on 2022/10/9.
/// 
///

import Foundation

func partition(_ s: String) -> [[String]] {
    guard !s.isEmpty else { return [[String]]() }
    
    var ret = [[String]]()
    for i in s.indices {
        let part = String(s[s.startIndex...i])
        if isPalidrome(part) {
            if part == s {
                ret += [[part]]
            } else {
                let partitions = partition(String(s[s.index(after: i)...]))
                if !partitions.isEmpty {
                    ret += partitions.map { [part] + $0 }
                }
            }
        }
    }
    
    return ret
}

private func isPalidrome(_ s: String) -> Bool {
    guard !s.isEmpty else { return false }
    
    var start = s.startIndex
    var end = s.index(before: s.endIndex)
    
    while start < end {
        guard s[start] == s[end] else { return false }
        start = s.index(after: start)
        end = s.index(before: end)
    }
    
    return true
}
