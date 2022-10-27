///
/// Created by Zheng Kanyan on 2022/10/9.
/// 
///

import Foundation

func restoreIpAddresses(_ s: String) -> [String] {
    let ipComponents = findIPComponents(s, index: 0)
    
    return ipComponents.filter { $0.count == 4 }.map { components in
        components.joined(separator: ".")
    }
}

func findIPComponents(_ s: String, index: Int) -> [[String]] {
    guard !s.isEmpty && index <= 3 else { return [[String]]() }
    
    if index == 3 {
        let first = String(s.first!)
        guard Int(first) != 0 || s.count == 1 else { return [[String]]() }
        guard Int(s)! <= 255 else { return [[String]]() }
        return [[s]]
    }
    
    var ret = [[String]]()
    
    let first = String(s.first!)
    let ipComponents = findIPComponents(String(s[s.index(s.startIndex, offsetBy: 1)...]), index: index + 1)
    if !ipComponents.isEmpty {
        ret += ipComponents.map { [first] + $0 }
    }
    
    if s.count >= 2 && (Int(first) != 0) {
        var firstPart = String(s[s.index(s.startIndex, offsetBy: 0)...s.index(s.startIndex, offsetBy: 1)])
        var ipComponents = findIPComponents(String(s[s.index(s.startIndex, offsetBy: 2)...]), index: index + 1)
        if !ipComponents.isEmpty {
            ret += ipComponents.map { [firstPart] + $0 }
        }
        if s.count >= 3 {
            firstPart = String(s[s.startIndex...s.index(s.startIndex, offsetBy: 2)])
            if Int(firstPart)! <= 255 {
                ipComponents = findIPComponents(String(s[s.index(s.startIndex, offsetBy: 3)...]), index: index + 1)
                if !ipComponents.isEmpty {
                    ret += ipComponents.map { [firstPart] + $0 }
                }
            }
        }
    }
    
    return ret
}
