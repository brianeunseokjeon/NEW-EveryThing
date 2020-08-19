import UIKit

var h = [1,3,5,0]
var count = 1
var hSet = Set<Int>()
// 2부터 제곱근까지..Int(sqrt(357))
//일단 2,3,5,7,11,13,17,19 이면 제외

//var resultContainerArray:[[Int]] = []
//var aaa = [Int]()




var intSet: Set<Int> = []

func permutation(_ arr : [Int],_ output : [Int],_ depth : Int,_ n : Int,_ r : Int) {
    var output = output
    var array = arr
    if depth == r {
        var result = ""
        for x in output {
            result += "\(x)"
        }
        intSet.insert(Int(result)!)
        return
    }
    for i in (0..<n) {
        output[depth] = arr[i]
        array.remove(at: i)
        permutation(array, output, depth+1, n-1, r)
        array.insert(arr[i], at: i)
    }

}

func prime(_ number:Int) -> Int? {
    switch number {
    case 2,3,5,7,11,13,17,19:
        return number
    case 0,1:
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


func solution(_ numbers:String) -> Int {
    //옵셔널까지 자동 제거.
    let intArray:[Int] = numbers.compactMap{Int(String($0))}
    var count = 0
    for ind in 1...intArray.count {
        let outPut: [Int] = Array(repeating: 0, count: ind)
        permutation(intArray, outPut, 0, intArray.count, ind)

    }
    for pri in intSet {
        guard let _ = prime(pri) else { continue }
        count += 1
    }
    
    
    return count
}

solution("011")
intSet





//조합;; 이거 필요없음

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
