///
/// Created by Zheng Kanyan on 2022/10/11.
/// 
///

import Foundation

private var m = 0
private var n = 0

// TODO: Optimize it

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    m = heights.count
    n = heights[0].count
    
    var heightsWithFlow = heights.enumerated().map { (i, row) in
        guard m != 1 && n != 1 else {
            return  row.map { ($0, true, true) }
        }
        if i == 0 {
            return row.enumerated().map { (j, height) in
                if j == n - 1 {
                    return (height, true, true)
                } else {
                    return (height, true, false)
                }
            }
        } else if i == m - 1 {
            return row.enumerated().map { (j, height) in
                if j == 0 {
                    return (height, true, true)
                } else {
                    return (height, false, true)
                }
            }
        } else {
            return row.enumerated().map { (j, height) in
                if j == 0 {
                    return (height, true, false)
                } else if j == n - 1 {
                    return (height, false, true)
                } else {
                    return (height, false, false)
                }
            }
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if heightsWithFlow[i][j].1 == true {
                dfsForPacific(&heightsWithFlow, i, j)
            }
            if heightsWithFlow[i][j].2 == true {
                dfsForAtlantic(&heightsWithFlow, i, j)
            }
        }
    }
    
    var ret = [[Int]]()
    for i in 0..<m {
        for j in 0..<n {
            if heightsWithFlow[i][j].1 == true
                && heightsWithFlow[i][j].2 == true {
                ret.append([i, j])
            }
        }
    }
    
    return ret
}

private let distances = [(0, 1), (1, 0), (-1, 0), (0, -1)]
private func inArea(_ i: Int, _ j: Int) -> Bool {
    i >= 0 && j >= 0 && i < m && j < n
}

private func dfsForPacific(_ heightsWithFlow: inout [[(Int, Bool, Bool)]],
                           _ i: Int, _ j: Int) {
    let cur = heightsWithFlow[i][j]
    
    for distance in distances {
        let newI = i + distance.0
        let newJ = j + distance.1
        
        if inArea(newI, newJ) {
            let height = heightsWithFlow[newI][newJ]
            if !height.1 && height.0 >= cur.0 {
                heightsWithFlow[newI][newJ].1 = true
                dfsForPacific(&heightsWithFlow, newI, newJ)
            }
        }
    }
}

private func dfsForAtlantic(_ heightsWithFlow: inout [[(Int, Bool, Bool)]],
                            _ i: Int, _ j: Int) {
    let cur = heightsWithFlow[i][j]
    
    for distance in distances {
        let newI = i + distance.0
        let newJ = j + distance.1
        
        if inArea(newI, newJ) {
            let height = heightsWithFlow[newI][newJ]
            if !height.2 && height.0 >= cur.0 {
                heightsWithFlow[newI][newJ].2 = true
                dfsForAtlantic(&heightsWithFlow, newI, newJ)
            }
        }
    }
}
