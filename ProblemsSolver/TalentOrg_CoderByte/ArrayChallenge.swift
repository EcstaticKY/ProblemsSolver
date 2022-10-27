//
//  ArrayChallenge.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/21.
//

import Foundation

// 判断给定数组能否转化为 a1 > a2 < a3 > a4 ... 这样的 wave 形式，能就返回 1，否则返回 0
func ArrayChallenge(_ arr: [Int]) -> Int {
    var map = [Int: Int]()
    for num in arr {
        map[num] = map[num] != nil ? map[num]! + 1 : 1
    }
    
    let totalCount = arr.count
    let moreThanHalfElements = map.filter { $0.value > totalCount / 2 }
    
    guard !moreThanHalfElements.isEmpty else { return 1 }

    if let moreThanHalfElement = moreThanHalfElements.first {
        guard moreThanHalfElement.value < totalCount / 2 + 1 else { return 0 }
        return map.filter { $0.key > moreThanHalfElement.key }.isEmpty ? 1 : 0
    }
    
    return 1
}
