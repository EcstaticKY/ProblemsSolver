///
/// Created by Zheng Kanyan on 2022/10/11.
/// 
///

import Foundation

private var m = 0
private var n = 0

func solve_better(_ board: inout [[Character]]) {
    m = board.count
    n = board[0].count
    
    for i in 0..<m {
        dfs(&board, i, 0)
        dfs(&board, i, n - 1)
    }
    if n > 1 {
        for j in 1..<n-1 {
            dfs(&board, 0, j)
            dfs(&board, m - 1, j)
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "A" {
                board[i][j] = "O"
            } else if board[i][j] == "O" {
                board[i][j] = "X"
            }
        }
    }
}

private func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
    guard i >= 0 && j >= 0 && i < m && j < n && board[i][j] == "O" else {
        return
    }
    
    board[i][j] = "A"
    
    dfs(&board, i+1, j)
    dfs(&board, i-1, j)
    dfs(&board, i, j+1)
    dfs(&board, i, j-1)
}
