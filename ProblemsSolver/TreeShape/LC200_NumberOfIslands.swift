///
/// Created by Zheng Kanyan on 2022/10/10.
/// 
///

// DFS FloodFill

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    var count = 0
    
    for i in grid.indices {
        for j in grid[i].indices {
            guard grid[i][j] == "1" else { continue }
            count += 1
            floodFill(in: &grid, i: i, j: j)
        }
    }
    
    return count
}

private func floodFill(in grid: inout [[Character]],
                                i: Int, j: Int) {
    
    grid[i][j] = "0"
    if i > 0 && grid[i-1][j] == "1" {
        floodFill(in: &grid, i: i-1, j: j)
    }
    if j > 0 && grid[i][j-1] == "1" {
        floodFill(in: &grid, i: i, j: j-1)
    }
    if i < grid.count - 1  && grid[i+1][j] == "1" {
        floodFill(in: &grid, i: i+1, j: j)
    }
    if j < grid[i].count - 1 && grid[i][j+1] == "1" {
        floodFill(in: &grid, i: i, j: j+1)
    }
}
