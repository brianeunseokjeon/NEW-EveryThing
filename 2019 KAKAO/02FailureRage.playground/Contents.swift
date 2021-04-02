import UIKit




func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageTuple = [(failureRate:Double,count:Int,level:Int)].init(repeating: (0,0,0), count: N)
    var currentRemainPerson = stages.count
    var result:[Int] = []
    for x in 0...N-1 {
        stageTuple[x].level = x+1
    }
    for level in stages {
        guard level < N+1 else {continue}
        stageTuple[level-1].count += 1
    }
 
    
    for level in 0...N-1 {
        stageTuple[level].failureRate = Double(stageTuple[level].count) / Double(currentRemainPerson)
        currentRemainPerson -= stageTuple[level].count
    }
    
    let sortStages = stageTuple.sorted { (first, second) -> Bool in
        if first.failureRate > second.failureRate {
            return true
        } else if first.failureRate == second.failureRate && first.level < second.level {
            return true
        } else {
            return false
        }
    }

    for level in sortStages {
        result.append(level.level)
    }
    
    
    return result
}

let stage = 5
let input = [2, 1, 2, 6, 2, 4, 3, 3]
//let stage = 4
//let input = [4,4,4,4]
solution(stage, input)
