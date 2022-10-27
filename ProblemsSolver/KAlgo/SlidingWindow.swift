//
//  SlidingWindow.swift
//  KAlgo
//
//  Created by Zheng Kanyan on 2020/8/20.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import Foundation

/*
 30. 串联所有单词的子串
 给定一个字符串 s 和一些长度相同的单词 words。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。

 注意子串要与 words 中的单词完全匹配，中间不能有其他字符，但不需要考虑 words 中单词串联的顺序。
 
 用String的时候多用append，用dict的时候多用下标，少用keys.contain
 */
func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    
    var result = [Int]()
    guard words.count > 0 && s.count > 0 else {
        return result
    }
    
    let wordsCount = words.count
    let wordLength = words[0].count
    
    guard s.count >= wordsCount * wordLength else {
        return result
    }
    
    let ss = s.utf8.map { UInt8($0) }
    let wordsFrequencyDic = words.reduce(into: [[UInt8]:Int]()) { (result, str) in
        let item = str.utf8.map { UInt8($0) }
        result[item] = result[item, default: 0] + 1
    }
    
    var windowStart = ss.startIndex
    while windowStart <= ss.endIndex - (wordLength * wordsCount) {
        var wordsSeen = [[UInt8]:Int]()
        var windowStep = windowStart
        while windowStep < windowStart + wordLength * wordsCount {
            let word = Array(ss[windowStep..<(windowStep+wordLength)])
            if !wordsFrequencyDic.keys.contains(word) {
                break
            }
            wordsSeen[word] = wordsSeen[word, default: 0] + 1
            if wordsSeen[word]! > wordsFrequencyDic[word]! {
                break
            }
            windowStep = windowStep + wordLength
        }
        if windowStep - windowStart == wordsCount * wordLength {
            result.append(windowStart)
        }
        windowStart += 1
    }
    
    return result
}
