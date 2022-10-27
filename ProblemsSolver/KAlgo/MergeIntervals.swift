//
//  MergeIntervals.swift
//  KAlgo
//
//  Created by Zheng Kanyan on 2020/8/31.
//  Copyright © 2020 Zheng Kanyan. All rights reserved.
//

import Foundation

class MergeIntervals {
    
    /* 56. 合并区间
    给出一个区间的集合，请合并所有重叠的区间。
     */
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // 先排序，后插入
        let sorted = intervals.sorted { $0.first! < $1.first! }
        let result = sorted.reduce(into: [[Int]]()) { re, b in
            if re.count <= 0 {
                re.append(b)
                return
            }
            let a = re.last!
            if b[1] <= a[0] {
                re.removeLast()
                re.append([a[0], b[1] > a[1] ? b[1] : a[1]])
            } else {
                re.append(b)
            }
        }
        return result
    }
    
    /* 57. 插入区间
     给出一个无重叠的 ，按照区间起始端点排序的区间列表。
     在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。
     */
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.count <= 0 {
            return [newInterval]
        }
        
        var result = [[Int]]()
        var i = 0
        // skip (and add to output) all intervals that come before the 'newInterval'
        while i < intervals.count && intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i += 1
        }
        
        // merge all intervals that overlap with 'newInterval'
        var x = newInterval
        while i < intervals.count && intervals[i][0] <= newInterval[1] {
            x = [min(intervals[i][0], x[0]), max(intervals[i][1], x[1])]
            i += 1
        }
        // insert the newInterval
        result.append(x)
        
        // add all the remaining intervals to the output
        while i < intervals.count {
            result.append(intervals[i])
            i += 1
        }
        
        return result
    }
    
    /*
     986. 区间列表的交集
     给定两个由一些 闭区间 组成的列表，每个区间列表都是成对不相交的，并且已经排序。
     返回这两个区间列表的交集。
     （形式上，闭区间 [a, b]（其中 a <= b）表示实数 x 的集合，而 a <= x <= b。两个闭区间的交集是一组实数，要么为空集，要么为闭区间。例如，[1, 3] 和 [2, 4] 的交集为 [2, 3]。）
     */
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        var i = 0, j = 0
        while i < A.count, j < B.count {
            if !(A[i][1] < B[j][0]) && !(A[i][0] > B[j][1]) {
                result.append([max(A[i][0], B[j][0]), min(A[i][1], B[j][1])])
            }
            if A[i][1] <= B[j][1] {
                i += 1
            } else {
                j += 1
            }
        }
        
        return result
    }
    
    /*
     Minimum Meeting Rooms (hard) #
     Given a list of intervals representing the start and end time of ‘N’ meetings, find the minimum number of rooms required to hold all the meetings.
     先按照会议开始时间排序，搞一个minHeap用来存放当前重叠的会，minHeap按照会议的结束时间排序
     将minHeap里结束时间早于新来的会的会议都清空就是当前重叠的会
     */
    func minimumMeetingRooms(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0[0] <= $1[0] }
        var minNum = 0
        var minHeap = [[Int]]()
        
        for interval in sorted {
            if minHeap.count <= 0 {
                minHeap.append(interval)
                continue
            }
            var i = minHeap.count - 1
            while i >= 0 && minHeap[i][1] > interval[0] {
                i -= 1
            }
            minHeap.removeFirst(i + 1)
            if minHeap.count <= 0 {
                minHeap.append(interval)
            } else {
                var j = minHeap.count - 1
                while j >= 0 && minHeap[j][1] > interval[1] {
                    j -= 1
                }
                minHeap.insert(interval, at: j+1)
            }
            minNum = max(minNum, minHeap.count)
        }
        return minNum
    }
    
    /*
     Maximum CPU Load (hard) #
     We are given a list of Jobs. Each job has a Start time, an End time, and a CPU load when it is running. Our goal is to find the maximum CPU load at any time if all the jobs are running on the same machine.
     */
    func maximumCPULoad(_ jobs: [[Int]]) -> Int {
        var maxLoad = 0
        var currentLoad = 0
        let sorted = jobs.sorted { $0[0] <= $1[0] }
        var minHeap = [[Int]]()
        for load in sorted {
            if minHeap.count <= 0 {
                minHeap.append(load)
            } else {
                var i = minHeap.count - 1
                while i >= 0 && minHeap[i][1] > load[0] {
                    i -= 1
                }
                if i >= 0 {
                    for _ in 0...i {
                        currentLoad -= minHeap.first![2]
                        minHeap.removeFirst()
                    }
                }
                if minHeap.count == 0 {
                    minHeap.append(load)
                } else {
                    var j = minHeap.count - 1
                    while j >= 0 && minHeap[j][1] > load[1] {
                        j -= 1
                    }
                    minHeap.insert(load, at: j+1)
                }
            }
            currentLoad += load[2]
            maxLoad = max(currentLoad, maxLoad)
        }
        return maxLoad
    }
    
    /*
     Employee Free Time (hard) #
     For ‘K’ employees, we are given a list of intervals representing the working hours of each employee. Our goal is to find out if there is a free interval that is common to all employees. You can assume that each list of employee working hours is sorted on the start time.
     */
    func findEmployeeFreeTime(_ schedules: [[[Int]]]) -> [[Int]] {
        var result = [[Int]]()
        
        let sorted = schedules.reduce(into: [[Int]]()) { (re, x) in
            for interval in x {
                re.append(interval)
            }
        }
        .sorted { $0[0] <= $1[0] }
        
        var prevMaxEndTime = -1
        
        for schedule in sorted {
            if prevMaxEndTime < 0 {
                prevMaxEndTime = schedule[1]
                continue
            }
            if schedule[0] > prevMaxEndTime {
                result.append([prevMaxEndTime, schedule[0]])
                prevMaxEndTime = schedule[1]
            } else {
                prevMaxEndTime = max(prevMaxEndTime, schedule[1])
            }
        }
        
        return result
    }
}
