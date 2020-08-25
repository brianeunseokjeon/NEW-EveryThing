import UIKit
//완전 탐색으로 어떻게 풀지?

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let addTotal = brown + yellow
    
    
    for x in 2...(addTotal/2) {
        if addTotal % x == 0 {
            let value1 = x
            let value2 = addTotal / x
            let minValue = min(value1, value2)
            let maxValue = max(value1, value2)
            if (minValue + maxValue) * 2 - 4 == brown {
                return [maxValue,minValue]
            }
            
        }
    }
    
    return []
}


solution(24, 24)
