///
/// Created by Zheng Kanyan on 2022/10/1.
/// 
///

import Foundation

/// 直接记录路径在路径很多的时候耗时和内存飙升，无法通过测试，下面的解答2更好
func FindLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
    var ret = [[String]]()
    
    var stack = [[KString]]()
    stack.append([KString(beginWord)])
    var list = wordList.map { KString($0) }
    let end = KString(endWord)
    
    var found = false
    var shouldDeleteSet = Set<KString>()
    var curSteps = 1
    while let curArr = stack.popLast() {
        if found {
            guard curArr.count < ret[0].count else { break }
            if curArr.last!.distance1(with: end) {
                ret.append((curArr + [end]).map { $0.toString() })
            }
        } else {
            if curArr.count > curSteps {
                curSteps = curArr.count
                list.removeAll { shouldDeleteSet.contains($0) }
                shouldDeleteSet.removeAll()
            }
            for index in list.indices {
                if curArr.last!.distance1(with: list[index]) {
                    if list[index] == end {
                        ret.append((curArr + [end]).map { $0.toString() })
                        found = true
                        break
                    } else {
                        stack.insert(curArr + [list[index]], at: 0)
                        shouldDeleteSet.insert(list[index])
                    }
                }
            }
        }
    }
    
    return ret
}

/**
BFS:
记录有向无权图的所有边到 graph 里，每一层记录完后，将这一层用到的节点删除掉，因为后面用不到啦。
一旦找到，这一层的其他节点就直接和 end 比较即可，不需要再遍历了。

DFS:
图构建完毕后，从终点出发，反向构建路径，最后 reverse 即可
 */
func FindLadders2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
    var graph = [[(from: KString, to: KString)]]()
    let begin = KString(beginWord)
    let end = KString(endWord)
    var list = wordList.map { KString($0) }
    
    for index in list.indices.reversed() {
        if begin.distance1(with: list[index]) {
            guard list[index] != end else { return [[beginWord, endWord]] }
            if graph.isEmpty { graph.append([(from: KString, to: KString)]()) }
            graph[0].append((from: begin, to: list[index]))
            list.remove(at: index)
        }
    }
    
    var found = false
    var curStep = 0
    while true {
        var shouldDeleteNodes = Set<KString>()
        let lastNodes = Set(graph[curStep].map { $0.to })
        
        for lastNode in lastNodes {
            if found {
                if lastNode.distance1(with: end) {
                    graph[curStep+1].append((from: lastNode, to: end))
                }
                continue
            }
            for word in list {
                if lastNode.distance1(with: word) {
                    if graph.count < curStep + 2 {
                        graph.append([(from: KString, to: KString)]())
                    }
                    graph[curStep+1].append((from: lastNode, to: word))
                    if word == end {
                        found = true
                        break
                    }
                    shouldDeleteNodes.insert(word)
                }
            }
        }
        
        guard !found && !shouldDeleteNodes.isEmpty else { break }
        list.removeAll { shouldDeleteNodes.contains($0) }
        curStep += 1
    }
    
    guard found else { return [[String]]() }
    
    var stack = [[end]]
    while let sides = graph.popLast() {
        var newStack = [[KString]]()
        for reversedPath in stack {
            let lastNode = reversedPath.last!
            sides.filter { side in
                side.to == lastNode
            }.forEach { side in
                newStack.append(reversedPath + [side.from])
            }
        }
        stack = newStack
    }
    
    return stack.map { path in
        path.reversed().map { $0.toString() }
    }
}
