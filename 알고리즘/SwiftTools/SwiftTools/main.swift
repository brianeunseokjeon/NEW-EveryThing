//
//  main.swift
//  SwiftTools
//
//  Created by 맥북프로에임메드 on 2021/04/29.
//

import Foundation



struct Solution3 {
    init() {
        let n = Int(readLine()!)!
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        var result = Set<Int>()
        func DFS(sum:Int,level:Int) {
            if level == n {
                if sum != 0 {
                    result.insert(abs(sum))
                }
                return
            }
            
            let currentValue = input[level]
            
            DFS(sum: sum+currentValue, level: level+1)
            DFS(sum: sum-currentValue, level: level+1)
            DFS(sum: sum, level: level+1)
        }

        DFS(sum: 0, level: 0)
        print(result.max()! - result.count)
    }
}

struct Solution4 {
    init() {
        let totalSum = Int(readLine()!)!
        let coinCount = Int(readLine()!)!
        
        var coinsContainer = [[Int]]()
        
        var numberOfCases = 0

        for _ in 0..<coinCount {
            let newInput = readLine()!.split(separator: " ").map{Int($0)!}
            coinsContainer.append(newInput)
        }
        
        func DFS(sum:Int,level:Int) {
            if level == coinCount {
                if sum == totalSum {
                    numberOfCases += 1
                }
                return
            }
            
            let currentCoin = coinsContainer[level][0]
            let currentHaveCoin = coinsContainer[level][1]
            
            for i in 0...currentHaveCoin {
                DFS(sum: sum+currentCoin*i, level: level+1)
            }
            
        }
        
        DFS(sum: 0, level: 0)
        print(numberOfCases)
        
    
    }
}


struct Solution5 {
    init() {
        let n = Int(readLine()!)!
        var computers = [[Int]]()
        
        for _ in 1...n {
            let comp = readLine()!.split(separator: " ").map{Int($0)!}
            computers.append(comp)
        }
        
        
       
    }
}



