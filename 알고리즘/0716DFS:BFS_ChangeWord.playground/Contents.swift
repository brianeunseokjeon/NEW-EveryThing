import UIKit

struct Word {
    let level:Int
    let myWord:String
    var isSuccess:Bool = false
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    var presentWord = begin
    var queue:[Word] = []
    
    while queue.isEmpty {
        <#code#>
    }
    
    
    
    
    return 0
}
func check(a:String,b:String,target:String,level:Int) -> Word? {
    var count = 0
    let arrayB = b.map{$0}
    let arrayA = a.map{$0}
    for (row,charac) in arrayB.enumerated() {
        if arrayA[row] != charac {
            count += 1
        }
        if count > 1 {
            return nil
        }
    }
    
    if count == 1 {
        if target == b {
            return Word(level: level, myWord: b, isSuccess: true)
        }
        return Word(level: level,myWord: b)
    } else {
        print("여기로 오지않을텐데?")
        return nil
    }
    
}
