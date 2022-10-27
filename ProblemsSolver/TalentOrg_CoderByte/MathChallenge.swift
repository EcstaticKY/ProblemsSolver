//
//  MathChallenge.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/21.
//

import Foundation

func MathChallenge(_ str: String) -> String {

    let formula = str.split(separator: " ")
    guard formula.count == 5 else {
        return "Not a valid formula"
    }
    
    let op = formula[1]
    let target = formula[4]
    
    if target.contains("x") {
        guard let num1 = Int(formula[0]), let num2 = Int(formula[2]) else {
            return "Not a valid formula"
        }
        switch op {
        case "+":
            return discoverX(with: String(target), for: num1 + num2)
        case "-":
            return discoverX(with: String(target), for: num1 - num2)
        case "*":
            return discoverX(with: String(target), for: num1 * num2)
        case "/":
            return discoverX(with: String(target), for: num1 / num2)
        default:
            return "Not a valid formula"
        }
    }
    
    return "Not implemented"
}

func discoverX(with unknownStr: String, for num: Int) -> String {
    var target = num
    var currentBase = 10 * (unknownStr.count - 1)
    for i in 0..<unknownStr.count {
        let index = unknownStr.index(unknownStr.startIndex, offsetBy: i)
        if unknownStr[index] != "x", let n = Int(String(unknownStr[index])) {
            target = target - n * currentBase
            guard target >= 0 else { return "Not a valid formula" }
        }
        currentBase /= 10
    }
    return String(target)
}
