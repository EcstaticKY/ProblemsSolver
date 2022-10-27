//
//  MinWindowSubstring.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/17.
//

import Foundation

/// https://coderbyte.com/results/suchbalance:Min%20Window%20Substring:Swift
func MinWindowSubstring(_ strArr: [String]) -> String {
    let whole = strArr[0]
    var pattern = strArr[1]
    var indexes = [Int]()
    var minIndexes = [Int]()
    
    var minLength: Int {
        guard !minIndexes.isEmpty else { return Int.max }
        guard minIndexes.count > 1 else { return Int.max }
        return (minIndexes.last! - minIndexes.first! + 1)
    }
    
    var currentIndex = 0
    while currentIndex < whole.count {
        let char = whole[whole.index(whole.startIndex, offsetBy: currentIndex)]
        if (pattern.contains(char) && !indexes.contains(currentIndex)) {
            indexes.append(currentIndex)
            indexes.sort()
            pattern.remove(at: pattern.firstIndex(of: char)!)
            if pattern.isEmpty {
                if (indexes.last! - indexes.first! + 1 < minLength) {
                    minIndexes = [indexes.first!, indexes.last!]
                }
                currentIndex = indexes.first! + 1
                pattern.append(whole[whole.index(whole.startIndex, offsetBy: indexes.first!)])
                indexes.removeFirst()
            } else {
                currentIndex += 1
            }
        } else {
            currentIndex += 1
        }
    }
    
    return whole.subString(from: minIndexes.first!, to: minIndexes.last! + 1)
}
