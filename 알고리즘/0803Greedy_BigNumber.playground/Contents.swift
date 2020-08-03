import UIKit

//그리디 큰수찾기.. 8번 10번 실패 12번은 (10000,2) 이런거 해결.
"" < "0"
let a:Character = "1"
a
func maxIndexResearch(_ str:String,count:Int) -> (String,String,Int) {
    var max = ""
    var maxIndex = 0
    var result = str
    var remainCount = count
    
    guard remainCount != str.count else { return ("","",0)}
    
    for (index,value) in str.enumerated() {
        if max < "\(value)" && index <= count {
            max = "\(value)"
            maxIndex = index
           
        } else if index > count {
            break
        }
    }
    
    remainCount -= maxIndex
    result.removeSubrange(result.startIndex...result.index(result.startIndex, offsetBy: maxIndex))
   
    return (max,result,remainCount)
}

func solution(_ number:String, _ k:Int) -> String {
    var maxString = ""
    var remainNumber = number
    var count = k

    while count > 0 {
        let remain = maxIndexResearch(remainNumber, count: count)
        maxString += remain.0
        remainNumber = remain.1
        count = remain.2
    }
    return maxString + remainNumber
}



solution("1924", 2)
solution("1231234", 3)
solution("4177252841", 4)
solution("87654321", 3)
