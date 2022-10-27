///
/// Created by Zheng Kanyan on 2022/10/1.
/// 
///

import Foundation

func LadderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var stack = [(word: beginWord, steps: 1)]
    var visited = Set<String>()
    
    while let cur = stack.popLast() {
        for word in wordList {
            if (!visited.contains(word)) {
                if closedWords(cur.word, word) {
                    if word == endWord { return cur.steps + 1 }
                    stack.insert((word, cur.steps + 1), at: 0)
                    visited.insert(word)
                }
            }
        }
    }
    
    return 0
}

private func closedWords(_ word1: String, _ word2: String) -> Bool {
    guard word1.count == word2.count else { return false }
    var diffCount = 0
    
    for index in word1.indices {
        if word1[index] != word2[index] {
            diffCount += 1
            guard diffCount <= 1 else { return false }
        }
    }
    
    return true
}

func LadderLength2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    
    var stack = [(word: KString(beginWord), steps: 1)]
    var list = wordList.map { KString($0) }
    let end = KString(endWord)
    
    while let cur = stack.popLast() {
        for index in (0..<list.count).reversed() {
            if cur.word.distance1(with: list[index]) {
                guard list[index] != end else { return cur.steps + 1 }
                stack.insert((list[index], cur.steps + 1), at: 0)
                list.remove(at: index)
            }
        }
    }
    
    return 0
}
