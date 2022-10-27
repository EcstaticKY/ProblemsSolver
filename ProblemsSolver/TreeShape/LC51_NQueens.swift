///
/// Created by Zheng Kanyan on 2022/10/11.
/// 
///

import Foundation

private var ret = [[String]]()

func solveNQueens(_ n: Int) -> [[String]] {
    ret = [[String]]()
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    dfs(&board, 0)
    
    return ret
}

private func dfs(_ board: inout [[Int]], _ i: Int) {
    board[i].indices.filter { board[i][$0] == 0 }.forEach { j in
        if i == board.count - 1 {
            board[i][j] = 2
            ret.append(board.map { row in
                row.map { $0 == 2 ? "Q" : "." }.joined()
            })
            board[i][j] = 0
        } else {
            let covered = coverBelow(&board, i, j)
            dfs(&board, i + 1)
            
            // recover
            board[i][j] = 0
            covered.forEach { board[$0.i][$0.j] = 0 }
        }
    }
}

private func coverBelow(_ board: inout [[Int]], _ i: Int, _ j: Int) -> [(i: Int, j: Int)] {
    board[i][j] = 2
    
    var covered = [(i: Int, j: Int)]()
    
    for newI in i+1..<board.count {
        if board[newI][j] == 0 {
            board[newI][j] = 1
            covered.append((newI, j))
        }
        var newJ = i + j - newI
        if newJ >= 0 && board[newI][newJ] == 0 {
            board[newI][newJ] = 1
            covered.append((newI, newJ))
        }
        newJ = j + newI - i
        if newJ < board.count && board[newI][newJ] == 0 {
            board[newI][newJ] = 1
            covered.append((newI, newJ))
        }
    }
    
    return covered
}
