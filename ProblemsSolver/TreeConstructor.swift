//
//  TreeConstructor.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/18.
//

import Foundation

/// https://coderbyte.com/information/Tree%20Constructor
func TreeConstructor(_ strArr: [String]) -> String {
    let pairs: [(Int, Int)] = strArr.map { element -> (Int, Int) in
        let startIndex = element.index(element.startIndex, offsetBy: 1)
        let endIndex = element.index(element.endIndex, offsetBy: -1)
        let pair: [String] = (element[startIndex..<endIndex]
            .split(separator: ",")).map { String($0) }
        return (Int(pair[0])!, Int(pair[1])!)
    }
    
    let parents = Set(pairs.map { $0.1 })
    let children = Set(pairs.map { $0.0 })
    
    var foundRoot = false
    for parent in parents {
        let pairsWithThisParent = pairs.filter { $0.1 == parent }
        let pairsWithThisParentAsChild = pairs.filter { $0.0 == parent }
        
        guard pairsWithThisParent.count <= 2 else { return "false" }
        if pairsWithThisParentAsChild.count == 0 {
            guard foundRoot == false else { return "false" }
            foundRoot = true
        }
    }
    
    for child in children {
        let pairsWithThisChild = pairs.filter { $0.0 == child }
        guard pairsWithThisChild.count <= 1 else { return "false" }
    }
    
    return foundRoot ? "true" : "false"
}
