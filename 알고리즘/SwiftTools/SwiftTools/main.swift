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


struct Solution_Programmers_Network {
    init() {
        let n = Int(readLine()!)!
        var clothes = [[String]]()
        
        var dic = [String:[String]]()
        
        for _ in 1...n {
            let clo = readLine()!.split(separator: " ").map{String($0)}
            clothes.append(clo)
        }
      
        for i in 0..<n {
            let part = clothes[i][1]
            let cloth = clothes[i][0]
            if dic[part] == nil {
                dic.updateValue([cloth], forKey: part)
            } else {
                dic[part]?.append(cloth)
            }
        }
        
        let totalCases = numberOfCases(dic)
        
        print(totalCases)
    }
    
    
    func numberOfCases(_ dic:[String : [String]]) -> Int {
        let key = dic.keys
        var total = 1
        for k in key {
            total *= (dic[k]!.count + 1)
        }
        total -= 1
        return total
    }
}





func solution(_ clothes:[[String]]) -> Int {
    func numberOfCases(_ dic:[String : [String]]) -> Int {
        let key = dic.keys
        var total = 1
        for k in key {
            total *= (dic[k]!.count + 1)
        }
        total -= 1
        return total
    }
    
    var dic = [String:[String]]()
    
  
    for i in 0..<clothes.count {
        let part = clothes[i][1]
        let cloth = clothes[i][0]
        if dic[part] == nil {
            dic.updateValue([cloth], forKey: part)
        } else {
            dic[part]?.append(cloth)
        }
    }
    
    let totalCases = numberOfCases(dic)
    return totalCases
}
