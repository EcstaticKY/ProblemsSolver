///
/// Created by Zheng Kanyan on 2022/9/26.
/// 
///

import Foundation

func EvalRPN(_ tokens: [String]) -> Int {
    var opStack = [Int]()
    
    for token in tokens {
        if let op = try? OP(token) {
            if case .num(let num) = op {
                opStack.append(num)
            } else {
                guard let num2 = opStack.popLast(),
                        let num1 = opStack.popLast() else {
                    return -1
                }
                if let partialResult = try? OP.calculate(op: op, num1: num1, num2: num2) {
                    opStack.append(partialResult)
                }
            }
        }
    }
    
    return opStack.first!
}

private enum OP {
    case add
    case substract
    case multiply
    case divide
    case num(Int)
    
    init(_ s: String) throws {
        switch s {
        case "+": self = .add
        case "-": self = .substract
        case "*": self = .multiply
        case "/": self = .divide
        default:
            guard let num = Int(s) else {
                throw NSError(domain: "EvalRPN: invalid input", code: 0)
            }
            self = .num(num)
        }
    }
    
    static func calculate(op: OP, num1: Int, num2: Int) throws -> Int {
        switch op {
        case .add:
            return num1 + num2
        case .substract:
            return num1 - num2
        case .multiply:
            return num1 * num2
        case .divide:
            return num1 / num2
        case .num(_):
            throw NSError(domain: "EvalRPN: invalid input", code: 0)
        }
    }
}
