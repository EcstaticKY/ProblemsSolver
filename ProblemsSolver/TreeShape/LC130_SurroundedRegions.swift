///
/// Created by Zheng Kanyan on 2022/10/10.
/// 
///

import Foundation

private let distances = [(0, -1), (0, 1), (1, 0), (-1, 0)]
private var m = 0
private var n = 0
private var notSurroundedRegions = Set<Point>()

private struct Point: Hashable {
    let i: Int
    let j: Int
}

func solve(_ board: inout [[Character]]) {
    m = board.count
    n = board[0].count
    
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "O" && !notSurroundedRegions.contains(Point(i: i, j: j)) {
                var regions = [(i: Int, j: Int)]()
                surrounded(&board, i, j, &regions)
                regions.forEach { point in
                    board[point.i][point.j] = "X"
                }
            }
        }
    }
}

private func inArea(_ i: Int, _ j: Int) -> Bool {
    i >= 0 && i < m && j >= 0 && j < n
}

private func surrounded(_ board: inout [[Character]],
                        _ i: Int, _ j: Int,
                        _ regions: inout [(i: Int, j: Int)]) {
    regions.append((i, j))
    
    for distance in distances {
        let newI = i + distance.0
        let newJ = j + distance.1
        
        if inArea(newI, newJ) {
            if board[newI][newJ] == "O" {
                if notSurroundedRegions.contains(Point(i: newI, j: newJ)) {
                    regions.forEach { point in
                        notSurroundedRegions.insert(Point(i: point.i, j: point.j))
                    }
                    regions.removeAll()
                    break
                } else if regions.firstIndex(where: { point in
                    point.i == newI && point.j == newJ
                }) == nil {
                    surrounded(&board, newI, newJ, &regions)
                }
            }
        } else {
            regions.forEach { point in
                notSurroundedRegions.insert(Point(i: point.i, j: point.j))
            }
            regions.removeAll()
            break
        }
    }
}
