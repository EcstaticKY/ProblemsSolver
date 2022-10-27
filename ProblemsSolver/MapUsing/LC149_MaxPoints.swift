//
//  LC149_MaxPoints.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

func MaxPoints(_ points: [[Int]]) -> Int {
    guard points.count >= 2 else { return 1 }
    guard points.count >= 3 else { return 2 }
    
    var maxPoints = 2
    
    let sortedPoints = points.sorted { point1, point2 in
        point1[0] < point2[0]
    }
    let totalPointsCount = sortedPoints.count
    
    for i in 0..<totalPointsCount-1 {
        var gradientMap = [Gradient:Int]()
        for j in i+1..<totalPointsCount {
            let gradient = Gradient(point1: sortedPoints[i], point2: sortedPoints[j])
            gradientMap[gradient] = gradientMap[gradient] != nil ? gradientMap[gradient]! + 1 : 1
        }
        
        let maxCount = 1 + gradientMap.values.reduce(0) { partialResult, count in
            count > partialResult ? count : partialResult
        }
        
        maxPoints = maxCount > maxPoints ? maxCount : maxPoints
    }

    return maxPoints
}

private struct Gradient: Equatable, Hashable {
    private let x: Int
    private let y: Int
    
    init(point1: [Int], point2: [Int]) {
        let deltaY = point2[1] - point1[1]
        let deltaX = point2[0] - point1[0]
        
        if deltaX == 0 {
            x = 0
            y = Int.max
        } else if deltaY == 0 {
            x = Int.max
            y = 0
        } else {
            let factor = Gradient.highestCommonFactor(between: abs(deltaX), and: abs(deltaY))
            
            x = deltaX / factor
            y = deltaY / factor
        }
    }
    
    private static func highestCommonFactor(between num1: Int, and num2: Int) -> Int {
        var a = max(num1, num2)
        var b = min(num1, num2)
        
        while true {
            let remain = a % b
            guard remain != 0 else { return b }
            a = b
            b = remain
        }
    }
}
