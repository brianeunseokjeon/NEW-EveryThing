import UIKit
// 일단 dfs / bfs 에 대해 아직 부족함..;
// 프로그래머스 - 네트워크 연결

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visit = Set<Int>()
    var stack = [0]
    var count = 0
    var temp = 0
    while visit.count != computers.count {
        var isVisit = false
        while !stack.isEmpty {
            let thisRow = stack.remove(at: 0)
            guard !visit.contains(thisRow) else { continue }
            isVisit = true
            visit.insert(thisRow)
            for (row,isConnect) in computers[thisRow].enumerated() {
                if !visit.contains(row) && isConnect == 1 {
                    stack.append(row)
                }
            }
        }
        if isVisit == true {
             count += 1
        }
       temp += 1
        stack.append(temp)
    }
    
    
    return count
}
solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
 
solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])
