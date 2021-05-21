import UIKit



//let greeting = "Guten Tag!"
//for i in 0..<greeting.count {
//    let index = greeting.index(greeting.startIndex, offsetBy:i)
//    print(greeting[index])
//}



func solution(_ N:Int, _ number:Int) -> Int {
    var total = [1:[N]]
    if N == number {
        return 1
    }
    
    for i in 2...9 {
        total.updateValue([], forKey: i)
    }
    
    for i in 2...8 {
        var list = total[i]!
        let high = Int(String.init(repeating: String(N), count: i))!
        list.append(high)
        for j in 1...(i/2) {
            for a in total[j]! {
                for b in total[i-j]! {
                    list.append(a+b)
                    list.append(a*b)
                    list.append(a-b)
                    list.append(b-a)
                    if a != 0 {
                        list.append(b/a)
                    } else if b != 0 {
                        list.append(a/b)
                    }
                    
                
                }
            }
        }
        total[i] = list
        let setList = Set(list)
        if setList.contains(number) {
            return i
        }
    }
    
    return -1
}

solution(5, 12)
