///
/// Created by Zheng Kanyan on 2022/10/11.
/// 
///

import Foundation

class SudokuSolution {
    
    private var grids = Array(repeating: Array(repeating: false, count: 10), count: 9)
    private var cols = Array(repeating: Array(repeating: false, count: 10), count: 9)
    private var rows = Array(repeating: Array(repeating: false, count: 10), count: 9)
    private var found = false
    
    func solveSudoku(_ board: inout [[Character]]) {
        
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    let num = Int(String(board[i][j]))!
                    cols[j][num] = true
                    rows[i][num] = true
                    grids[i/3*3+j/3][num] = true
                }
            }
        }
        
        dfs(&board, 0, 0)
    }
    
    private func possibleNums(_ board: inout [[Character]],
                              _ i: Int, _ j: Int) -> [Int] {
        var ret = [Int]()
        for num in 1...9 {
            guard !cols[j][num] && !rows[i][num] && !grids[i/3*3+j/3][num] else {
                continue
            }
            ret.append(num)
        }
        return ret
    }
    
    private func nextUnsolved(_ board: inout [[Character]],
                              _ i: Int, _ j: Int) -> (i: Int, j: Int)? {
        
        for newJ in j..<9 {
            guard board[i][newJ] != "." else { return (i, newJ) }
        }
        
        guard i + 1 < 9 else { return nil }
        for newI in i+1..<9 {
            for newJ in 0..<9 {
                guard board[newI][newJ] != "." else { return (newI, newJ) }
            }
        }
        
        return nil
    }
    
    private func hasUnsolved(_ board: inout [[Character]], after i: Int, _ j: Int) -> Bool {
        if j < 8 {
            return nextUnsolved(&board, i, j+1) != nil
        } else if i < 8 {
            return nextUnsolved(&board, i+1, 0) != nil
        } else {
            return false
        }
    }
    
    private func dfs(_ board: inout [[Character]],
                     _ i: Int, _ j: Int) {
        if let next = nextUnsolved(&board, i, j) {
            let nums = possibleNums(&board, next.i, next.j)
            if nums.count == 1 && !hasUnsolved(&board, after: next.i, next.j) {
                board[next.i][next.j] = Character("\(nums[0])")
                found = true
            } else {
                for num in nums {
                    board[next.i][next.j] = Character("\(num)")
                    cols[next.j][num] = true
                    rows[next.i][num] = true
                    grids[next.i/3*3+next.j/3][num] = true
                    
                    dfs(&board, next.i, next.j)
                    guard !found else {
                        return
                    }
                    
                    board[next.i][next.j] = Character(".")
                    cols[next.j][num] = false
                    rows[next.i][num] = false
                    grids[next.i/3*3+next.j/3][num] = false
                }
            }
        }
    }
}
