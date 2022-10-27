//
//  LC49_GroupAnagrams.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

/// Group 相同字符组成的数组
func GroupAnagrams(_ strs: [String]) -> [[String]] {
    
    let map = Dictionary(grouping: strs) { str in
        str.sorted()
    }
    
    return Array(map.values)
}
