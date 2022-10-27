//
//  LC447_NumberOfBoomerangs.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

func NumberOfBoomerangs(_ points: [[Int]]) -> Int {
    var distanceMap = [Int: [[Int]]]()
    let count = points.count
    var result = 0
    for i in 0..<count-1 {
        for j in i+1..<count {
            let distance = distancePow2(between: points[i], and: points[j])
            if let pointPairs = distanceMap[distance] {
                result += pointPairs.filter { pointPair in
                    pointPair.contains(i) || pointPair.contains(j)
                }.count
                distanceMap[distance] = pointPairs + [[i, j]]
            } else {
                distanceMap[distance] = [[i, j]]
            }
        }
    }
    
    return result * 2
}

/// This is a better one, less storage and time cost
/// 为每个点创建它自己的 map 即可
/// 时间复杂度：n, 空间复杂度：n^2
func NumberOfBoomerangs2(_ points: [[Int]]) -> Int {
    let count = points.count
    var result = 0
    for i in 0..<count {
        var distanceMap = [Int: Int]()
        for j in 0..<count {
            if i != j {
                let distance = distancePow2(between: points[i], and: points[j])
                distanceMap[distance] = distanceMap[distance] != nil ? distanceMap[distance]! + 1 : 1
            }
        }
        
        distanceMap.values.filter { $0 >= 2 }.forEach { count in
            result += count * (count - 1)
        }
    }
    
    return result
}

private func distancePow2(between point1: [Int], and point2: [Int]) -> Int {
    (point1[0] - point2[0]) * (point1[0] - point2[0]) + (point1[1] - point2[1]) * (point1[1] - point2[1])
}
