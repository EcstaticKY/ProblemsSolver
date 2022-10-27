//
//  Pow.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/20.
//

import Foundation

func pow(_ base: Int, _ expo: Int) -> Int {
    Array(repeating: base, count: expo).reduce(1, *)
}
