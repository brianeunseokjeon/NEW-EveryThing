//
//  DFS_2.swift
//  SwiftTools
//
//  Created by 맥북프로에임메드 on 2021/04/29.
//

import Foundation


struct MySolution2 {
    var maxValue = 0
    var days:[Int] = []
    init() {
        let n = Int(readLine()!)!
        var times = [[0,0]]

        for _ in 0..<n {
            let newInput = readLine()!.split(separator: " ").map{Int($0)!}
            times.append(newInput)
        }

        func dfs(maxMoney:Int,currentDay:Int,appendDays:[Int]) {
            var myMoney = maxMoney
            var appendDays = appendDays
            var currentDay = currentDay
            if currentDay == n+1 {
                if maxMoney > maxValue {
                    maxValue = maxMoney
                    days = appendDays
                }
                
                return
            }
            
            for day in currentDay...n {
                if day + times[day][0] <= n+1 {
                    currentDay = day
                    myMoney += times[day][1]
                    appendDays.append(currentDay)
                    currentDay += times[day][0]
                    dfs(maxMoney: myMoney, currentDay: currentDay ,appendDays: appendDays)
                    appendDays.removeLast()
                    myMoney -= times[day][1]
                    currentDay -= times[day][0]
                }
                
                if day == n {
                    if maxMoney > maxValue {
                        maxValue = maxMoney
                        days = appendDays
                    }
                }
            }
        }
        
        dfs(maxMoney: 0, currentDay: 1,appendDays: [])
        print(maxValue)
        print(days)

    }
}
//정답지..
struct Solution2 {
    var maxValue = 0
    var days:[Int] = []
    init() {
        let n = Int(readLine()!)!
        var times = [[0,0]]

        for _ in 0..<n {
            let newInput = readLine()!.split(separator: " ").map{Int($0)!}
            times.append(newInput)
        }
        
        func DFS(days:Int,money:Int) {
            if days == n+1 {
                if money > maxValue {
                    maxValue = money
                }
            } else {
                if days + times[days][0] <= n+1 {
                    DFS(days: days+times[days][0], money: money+times[days][1])
                } else {
                    DFS(days: days+1, money: money)
                }
            }
        }


        DFS(days: 1, money: 0)
        print(maxValue)
        print(days)
    }
}

//let a = MySolution2()

/*
 7
 4 20
 2 10
 3 15
 3 20
 2 30
 2 20
 1 10
 5
 3 10
 2 15
 1 10
 1 30
 2 10
 */

