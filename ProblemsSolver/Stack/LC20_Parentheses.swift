///
/// Created by Zheng Kanyan on 2022/9/26.
/// 
///

import Foundation

func IsValid(_ s: String) -> Bool {
    var leftParentheses = ""
    
    for c in s {
        if c == "(" || c == "{" || c == "[" {
            leftParentheses.append(c)
        }
        if c == "]" {
            guard let rightParenthes = leftParentheses.popLast(),
                    rightParenthes == "[" else {
                return false
            }
        }
        if c == "}" {
            guard let rightParenthes = leftParentheses.popLast(),
                    rightParenthes == "{" else {
                return false
            }
        }
        if c == ")" {
            guard let rightParenthes = leftParentheses.popLast(),
                    rightParenthes == "(" else {
                return false
            }
        }
    }
    
    return leftParentheses.isEmpty
}
