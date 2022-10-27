//
//  FindDuplicateFileInSystem.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/19.
//

import Foundation

/// LeetCode 609
/// https://leetcode.com/problems/find-duplicate-file-in-system/

func FindDuplicateFilesInSystem(_ paths: [String]) -> [[String]] {
    var contentPaths = [Substring: [String]]()
    for path in paths {
        var elements = path.split(separator: " ")
        if (elements.count > 1) {
            let directory = elements.removeFirst()
            elements.forEach { file in
                if let leftBracketIndex = file.firstIndex(of: "(") {
                    let fileName = file[file.startIndex..<leftBracketIndex]
                    let content = file[leftBracketIndex..<file.endIndex]
                    let newFile: String = directory + "/" + fileName
                    if var contentPath = contentPaths[content] {
                        contentPath.append(newFile)
                        contentPaths[content] = contentPath
                    } else {
                        contentPaths[content] = [newFile]
                    }
                }
            }
        }
    }
    
    return contentPaths.filter({ contentPath in
        contentPath.value.count > 1
    }).compactMap { contentPath in
        contentPath.value
    }
}
