import UIKit
//2시3분


extension String{
    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

func solution(_ s:String) -> Int {
    
//    var list = s.map{String($0)}
    
    var splitCount = 1
    var currentCount = s.count
    
    
    while splitCount <= s.count/2 {
        let splitList = s.getArrayAfterRegex(regex: ".{"+"\(splitCount)"+"}")
        var temp = ""
        var tempCount = 1
        let remainCount = s.count % splitCount
        var resultWord = ""
        for (index,x) in splitList.enumerated() {
            if index == 0 {
                temp = x
                continue
            }
            if x == temp {
                tempCount += 1
            } else {
                if tempCount > 1 {
                    resultWord += "\(tempCount)"+temp
                } else {
                    resultWord += temp
                }
                tempCount = 1
            }
            temp = x
            
            if index == (splitList.count - 1) && x == temp {
                if tempCount > 1 {
                    resultWord += "\(tempCount)"+temp
                } else {
                    resultWord += temp

                }
            }
            
            
        }
        
        print(resultWord)
        let resultCount = resultWord.count + remainCount
        currentCount = min(currentCount,resultCount)
        splitCount += 1
    }
    
    

    return currentCount

}

solution("aabbaccc")
solution("ababcdcdababcdcd")
solution("abcabcdede")
solution("abcabcabcabcdededededede")
solution("xababcdcdababcdcd")
