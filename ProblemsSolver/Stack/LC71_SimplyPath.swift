///
/// Created by Zheng Kanyan on 2022/9/26.
/// 
///

import Foundation

func SimplifyPath(_ path: String) -> String {
    var paths = [String]()
    
    var cur = 0
    var curPath = ""
    while cur < path.count {
        let c = path[path.index(path.startIndex, offsetBy: cur)]
        
        if c != "/" {
            curPath.append(c)
        }
        
        if c == "/" || cur == path.count - 1 {
            if !curPath.isEmpty {
                if curPath == ".." && !paths.isEmpty {
                    paths.removeLast()
                } else if curPath != "." && curPath != ".." {
                    paths.append(curPath)
                }
            }
            curPath = ""
        }
        
        cur += 1
    }
    
    guard !paths.isEmpty else { return "/" }
    return paths.reduce("") { partialResult, path in
        partialResult + "/" + path
    }
}
