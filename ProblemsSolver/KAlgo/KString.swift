//
//  KString.swift
//  KAlgo
//
//  Created by Zheng Kanyan on 2020/8/20.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import Foundation

struct KString: Equatable, Hashable {
    private var data = [UInt8]()
    
    init(_ s: String) {
        data = s.utf8.map { UInt8($0) }
    }
    
    subscript(_ i: Int) -> UInt8 {
        return data[i]
    }
    
    func distance1(with other: KString) -> Bool {
        guard data.count == other.data.count else { return false }
        var diff = false
        
        for index in data.indices {
            if data[index] != other.data[index] {
                guard !diff else { return false }
                diff = true
            }
        }
        
        return true
    }
    
    func toString() -> String {
        String(bytes: data, encoding: .utf8)!
    }
}
