import UIKit

// 재귀함수 작동.. 스택을 통해 작동하는데 생각보다 오래 반복함
var count = 0
func recursive(input:Int) -> Int {
    count += 1
    if input < 1 {
        print("count :",count)
        return 2
        
    } else {
        let i = recursive(input: input-1)*2+1
        print("일단 :",count,"번째",i)
        return i
    }
    
}

let b = recursive(input: 3)
