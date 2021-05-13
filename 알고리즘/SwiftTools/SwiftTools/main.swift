//
//  main.swift
//  SwiftTools
//
//  Created by 맥북프로에임메드 on 2021/04/29.
//

import Foundation


//단지 번호붙이기 -> 1인부분을 지날때마다 0으로 바꿔줘야함.

struct Solution12 {
    init () {
        var board = [[Int]]()
        
        let dx = [-1,0,1,0]
        let dy = [0,1,0,-1]
        var answer = 0
        var solution = [(Int,Int)]()
        
        let n = Int(readLine()!)!
        for _ in 1...n {
            let line = readLine()!.map{String($0)}.map{Int($0)!}
            board.append(line)
        }
        
        func DFS(_ coordinate:(Int,Int)) {
       
            
        
            
            
        }
        
        DFS((0,0))
        print(answer)
    }
}
