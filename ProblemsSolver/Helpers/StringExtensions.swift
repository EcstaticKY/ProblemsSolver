//
//  StringExtensions.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/18.
//

import Foundation

extension String {
    func subString(from: Int, to: Int) -> String {
       let startIndex = self.index(self.startIndex, offsetBy: from)
       let endIndex = self.index(self.startIndex, offsetBy: to)
       return String(self[startIndex..<endIndex])
    }
}
