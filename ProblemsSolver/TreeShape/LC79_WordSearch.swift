///
/// Created by Zheng Kanyan on 2022/10/10.
/// 
///

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    var path = [(i: Int, j: Int)]()
    return next(board, &path, word, word.startIndex)
}

private func next(_ board: [[Character]], _ curPath: inout [(i: Int, j: Int)],
                  _ word: String, _ curIndex: String.Index) -> Bool {
    
    let target = word[curIndex]
    let isLastChar = word.index(before: word.endIndex) == curIndex
    
    if curPath.isEmpty {
        for i in board.indices {
            for j in board[i].indices {
                guard board[i][j] == target else { continue }
                guard !isLastChar else { return true }
                curPath.append((i, j))
                guard !next(board, &curPath, word, word.index(after: curIndex)) else {
                    return true
                }
                curPath.removeLast()
            }
        }
    } else {
        let i = curPath.last!.i
        let j = curPath.last!.j
        if i > 0, !curPath.contains(where: { index in
            index.i == i - 1 && index.j == j
        }), board[i - 1][j] == target {
            guard !isLastChar else { return true }
            curPath.append((i-1, j))
            guard !next(board, &curPath, word, word.index(after: curIndex)) else {
                return true
            }
            curPath.removeLast()
        }
        if j > 0, !curPath.contains(where: { index in
            index.i == i && index.j == j - 1
        }), board[i][j - 1] == target {
            guard !isLastChar else { return true }
            curPath.append((i, j - 1))
            guard !next(board, &curPath, word, word.index(after: curIndex)) else {
                return true
            }
            curPath.removeLast()
        }
        if i < board.count - 1, !curPath.contains(where: { index in
            index.i == i + 1 && index.j == j
        }), board[i+1][j] == target {
            guard !isLastChar else { return true }
            curPath.append((i + 1, j))
            guard !next(board, &curPath, word, word.index(after: curIndex)) else {
                return true
            }
            curPath.removeLast()
        }
        if j < board[i].count - 1, !curPath.contains(where: { index in
            index.i == i && index.j == j + 1
        }), board[i][j + 1] == target {
            guard !isLastChar else { return true }
            curPath.append((i, j + 1))
            guard !next(board, &curPath, word, word.index(after: curIndex)) else {
                return true
            }
            curPath.removeLast()
        }
    }
    
    return false
}
