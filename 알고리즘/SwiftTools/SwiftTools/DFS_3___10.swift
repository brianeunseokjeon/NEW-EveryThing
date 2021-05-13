//
//  DFS_3.swift
//  SwiftTools
//
//  Created by 맥북프로에임메드 on 2021/04/30.
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




//송아지찾기
struct Solution7 {
    init() {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let n = input[0]
        let result = input[1]
        let max = 10000
        var visited = Array.init(repeating: 0, count: max+1)
        var distance = Array.init(repeating: 0, count: max+1)
        visited[n] = 1
        distance[n] = 0
        
        var q = [Int]()
        q.append(n)
        while !q.isEmpty {
            let current = q.removeFirst()
            if current == result {
                break
            }
            //앞으로 한칸, 뒤로한칸, 앞으로 5칸 이동가능.
            for next in [current-1,current+1,current+5] {
                if 0 < next && next <= max {
                    if visited[next] == 0 {
                        q.append(next)
                        visited[next] = 1
                        distance[next] = distance[current]+1
                    }
                }
            }
        }
        
        print(distance[result])
    }
}

protocol PairConvertible {
    associatedtype X
    associatedtype Y
    init(_ pair: (X, Y))
}
struct PairStruct<X, Y>: Hashable, PairConvertible where X: Hashable, Y: Hashable {
    let x: X
    let y: Y
    
    init(_ pair: (X, Y)) {
        self.x = pair.0
        self.y = pair.1
    }
    
    
}

// 사과나무 BFS
struct Solution8 {
    init() {
        let input = Int(readLine()!)!
        var apples = [[Int]]()
        
        for _ in 1...input {
            let apple = readLine()!.split(separator: " ").map{Int($0)!}
            apples.append(apple)
        }
        
        let limit = input / 2
        let startPoint = PairStruct((limit,limit))
        var q:[PairStruct<Int,Int>] = [startPoint]
        var visited = Set<PairStruct<Int, Int>>()
        var total = 0
        while !q.isEmpty {
            let current = q.removeFirst()
            if visited.contains(current) {
                continue
            }
            if current.y == -1 || current.x == -1 || current.y == input || current.x == input{
                break
            }
            total += apples[current.y][current.x]
            visited.insert(current)
            
            for next in [PairStruct((current.x,current.y-1)),PairStruct((current.x+1,current.y)),PairStruct((current.x,current.y+1)),PairStruct((current.x-1,current.y))] {
                q.append(next)
            }
        }
        print(total)
    }
}

//Solution8()

struct Solution81 {
    init() {
        let dx = [-1,0,1,0]
        let dy = [0,1,0,-1]
        
        let n = Int(readLine()!)!
        var apples = [[Int]]()
        
        for _ in 1...n {
            let apple = readLine()!.split(separator: " ").map{Int($0)!}
            apples.append(apple)
        }
        var visited = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
        var sum = 0
        var q = Array<(Int,Int)>()
        visited[n/2][n/2] = 1
        sum += apples[n/2][n/2]
        q.append((n/2,n/2))
        var l = 0
        
        while true {
            if l == n/2 {
                break
            }
            
            var size = q.count
            for _ in 0..<size {
                let tmp = q.removeFirst()
                for j in 0...3 {
                    let x = tmp.0 + dx[j]
                    let y = tmp.1 + dy[j]
                    if visited[x][y] == 0 {
                        sum += apples[x][y]
                        visited[x][y] = 1
                        q.append((x,y))
                    }
                }
            }
            l += 1
            print(visited)
            
        }
        
    }
}


 
struct Solution9 {
    init () {
        var board = [[Int]]()
        var q = [(0,0)]
        var distance = Array.init(repeating: Array.init(repeating: 0, count: 7), count: 7)
        let dx = [-1,0,1,0]
        let dy = [0,1,0,-1]
        
        
        for _ in 1...7 {
            let line = readLine()!.split(separator: " ").map{Int($0)!}
            board.append(line)
        }
        board[0][0] = 1
        
        while !q.isEmpty {
           let current = q.removeFirst()
            for i in 0...3 {
                let x = current.0 + dx[i]
                let y = current.1 + dy[i]
                if x >= 0 , y >= 0 , x < 7, y < 7 {
                    if board[x][y] == 0 {
                        distance[x][y] = distance[current.0][current.1] + 1
                        board[x][y] = 1
                    }
                }
                
            }
            
        }
        print(distance[6][6])

    }
}

/*
0 0 0 0 0 0 0
0 1 1 1 1 1 0
0 0 0 1 0 0 0
1 1 0 1 0 1 1
1 1 0 1 0 0 0
1 0 0 0 1 0 0
1 0 1 0 0 0 0
*/
//Solution9()
struct Solution10 {
    init () {
        var board = [[Int]]()
        
        let dx = [-1,0,1,0]
        let dy = [0,1,0,-1]
        var answer = 0
        var solution = [(Int,Int)]()
        
        for _ in 1...7 {
            let line = readLine()!.split(separator: " ").map{Int($0)!}
            board.append(line)
        }
        board[0][0] = 1
        
        func DFS(_ coordinate:(Int,Int)) {
          
            if coordinate.0 == 6 && coordinate.1 == 6 {
                answer += 1
                print(solution)
                
            } else {
                for i in 0...3 {
                    let x = coordinate.0 + dx[i]
                    let y = coordinate.1 + dy[i]
                    if x >= 0 && y >= 0 && x <= 6 && y <= 6 && board[x][y] == 0 {

                        board[x][y] = 1
                        solution.append((x,y))
                        DFS((x,y))
                        solution.removeLast()

                        board[x][y] = 0
                    } else {
                        continue
                    }
                }
            }
            
            
            
        }
        
        DFS((0,0))
        
        print(answer)
            
        
        
    }
}



/*
 0 0 0 0 0 0 0
 0 1 1 1 1 1 0
 0 0 0 1 0 0 0
 1 1 0 1 0 1 1
 1 1 0 0 0 0 1
 1 1 0 1 1 0 0
 1 0 0 0 0 0 0
 
 */
//Solution10()


struct Solution11 {
    init () {
        var board = [[Int]]()
        
        let dx = [-1,0,1,0]
        let dy = [0,1,0,-1]
        var answer = 0
        var solution = [(Int,Int)]()
        
        let n = Int(readLine()!)!
        for _ in 1...n {
            let line = readLine()!.split(separator: " ").map{Int($0)!}
            board.append(line)
        }
        
        func DFS(_ coordinate:(Int,Int)) {
            if coordinate == (n-1,n-1) {
                answer += 1
                return
            }
            
            for i in 0...3 {
                let x = coordinate.0 + dx[i]
                let y = coordinate.1 + dy[i]
                if x >= 0 && y >= 0 && x < n && y < n && (board[coordinate.0][coordinate.1] < board[x][y]) {
                    solution.append((x,y))
                    DFS((x,y))
                } else {
                    continue
                }
            }
            
            
        }
        
        DFS((0,0))
        print(answer)
    }
}
//Solution11()
