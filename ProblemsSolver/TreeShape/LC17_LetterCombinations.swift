///
/// Created by Zheng Kanyan on 2022/10/8.
/// 
///

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else { return [String]() }
    
    let digit = digits.first!
    var ret = [String]()
    switch digit {
    case "2":
        ret = ["a", "b", "c"]
    case "3":
        ret = ["d", "e", "f"]
    case "4":
        ret = ["g", "h", "i"]
    case "5":
        ret = ["j", "k", "l"]
    case "6":
        ret = ["m", "n", "o"]
    case "7":
        ret = ["p", "q", "r", "s"]
    case "8":
        ret = ["t", "u", "v"]
    case "9":
        ret = ["w", "x", "y", "z"]
    default:
        break
    }
    
    let combinations = letterCombinations(String(digits[digits.index(digits.startIndex, offsetBy: 1)...]))
    guard !combinations.isEmpty else { return ret }
    
    return ret.flatMap { firstChar in
        combinations.map { combination in
            firstChar + combination
        }
    }
}
