import UIKit

var h = [1,3,5,1]
var count = 1
var hSet = Set<Int>()
// 2부터 제곱근까지..Int(sqrt(357))
//일단 2,3,5,7,11,13,17,19 이면 제외


hSet = Set(h)
while h.count >= count {
    count += 1
    if hSet.isEmpty {
        hSet = Set(h)
    }
    var temp = h
    
    
    for (index,x) in temp.enumerated() {
        var 첫번째자리 = temp.remove(at: index)
        
    }
    
}


 
func prime(_ number:Int) -> Int? {
    switch number {
    case 2,3,5,7,11,13,17,19:
        return number
    case 1:
        return nil
    default:
        for x in 2...Int(sqrt(Double(number))) {
            if number % x == 0 {
                return nil
            }
        }
        return number
    }
}

