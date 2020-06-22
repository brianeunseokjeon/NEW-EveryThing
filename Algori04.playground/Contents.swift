import UIKit
// https://programmers.co.kr/learn/courses/30/lessons/12979?language=swift
func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    let numberOfRadioBaseStations = 2 * w + 1
    var lastNumber = 0
    for station in stations {
        if station - w - 1 - lastNumber > 0 {
            let temp = Double(station - w - 1 - lastNumber) / Double(numberOfRadioBaseStations)
            answer += Int(ceil(temp))
        }
        lastNumber = station + w
    }
    if n - lastNumber > 0 {
        let temp = Double(n - lastNumber) / Double(numberOfRadioBaseStations)
        answer += Int(ceil(temp))
    }
    return answer
}
//solution(11, [4,11], 1)
//solution(16, [9], 2)



//https://programmers.co.kr/learn/courses/30/lessons/60060 2020카카오 가사검색
let words = ["frodo", "front", "frost", "frozen", "frame", "kakao"]
print(1)
let a = words.filter {
    return 5 == $0.count && $0.hasPrefix("fro")
}

//words.hasPrefix("fro")
//words.hasSuffix("odo")
let a1 = words.sorted { $0.count < $1.count}
print(a1)
func solution0504(_ words:[String], _ queries:[String]) -> [Int] {
    var result: [Int] = []
    let sortedWords = words.sorted { $0.count < $1.count}
    
    for query in queries {
        var tempQuery = query
        var wordPrefix = ""
        var wordSuffix = ""
        if query.hasPrefix("?") {

            tempQuery.removeAll { (cha) -> Bool in
                return cha == "?"
            }
            wordSuffix = tempQuery
        } else {


            tempQuery.removeAll { (cha) -> Bool in
                return cha == "?"
            }
            wordPrefix = tempQuery
        }
        var temp: [String] = []
        for word in sortedWords {
            guard query.count >= word.count else { break }
            if wordPrefix != "" && query.count == word.count && word.hasPrefix(wordPrefix) {
                 temp.append(word)
            } else if wordSuffix != "" && query.count == word.count && word.hasSuffix(wordSuffix) {
                 temp.append(word)
            }
           
        }
        
//        let temp = words.filter{
//            if wordPrefix != "" {
//                return query.count == $0.count && $0.hasPrefix(wordPrefix)
//            } else {
//                return query.count == $0.count && $0.hasSuffix(wordSuffix)
//            }
//        }
        result.append(temp.count)
    }
    
    
    return result
}
solution0504(words, ["fro??", "????o", "fr???", "fro???", "pro?"])
