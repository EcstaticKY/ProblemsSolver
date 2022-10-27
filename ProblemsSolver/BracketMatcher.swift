//
//  BracketMatcher.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/18.
//

import Foundation

/// https://coderbyte.com/editor/Bracket%20Matcher:Swift
func BracketMatcher(_ str: String) -> String {
    
    var unMatchedBracketsCount = 0
    
    for char in str {
        if (char == "(") {
            unMatchedBracketsCount += 1
        } else if (char == ")") {
            unMatchedBracketsCount -= 1
        }
        
        guard unMatchedBracketsCount >= 0 else {
            return "0"
        }
    }
    
    return unMatchedBracketsCount == 0 ? "1" : "0"
}
