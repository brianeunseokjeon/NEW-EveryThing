import UIKit

var h = [1,3,5,0]
var count = 1
var hSet = Set<Int>()
// 2부터 제곱근까지..Int(sqrt(357))
//일단 2,3,5,7,11,13,17,19 이면 제외

//var resultContainerArray:[[Int]] = []
//var aaa = [Int]()

// 현재 의미없는 조합을 구현했네?ㅎㅎ;;; 순열을 구해서.

func comb(arr:[Int],index:Int ,n:Int, r:Int,target:Int,currentValue:Int,indexRemain:Bool = false) {
    var value = currentValue
    if r == 0 {
        print(currentValue)
        return
    } else if target == n {
        return
    } else {
        if indexRemain == true {
            print("여기오니?",value)
            value /= 10
        }
        print("r " ,r,"index: ",index,"value :",value,"target",target)
        value *= 10
        value += arr[index]
        print("r " ,r,"index: ",index,"value :",value,"target",target)
        comb(arr: arr, index: index+1, n: n, r: r-1, target: target+1,currentValue: value)
        comb(arr: arr, index: index+1, n: n, r: r, target: target+1,currentValue: value ,indexRemain: true)
    }
}
comb(arr: [1,3,5], index: 0, n: 3, r: 2, target: 0, currentValue: 0)

while h.count >= count {
    count += 1
    if hSet.isEmpty {
        hSet = Set(h)
        if hSet.contains(0) {
            hSet.remove(0)
        }
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

