import UIKit


struct Word {
    let level:Int
    let myWord:String
}

//hit -> hat or hot
// hat -> hot ㄴㄴ안됨.. 불가하게.. hot -> hat 도 불가하게..
var words = ["hat","hot","dot","dog","lot","log","cog"]

//remove all index after
//words.removeSubrange(2...)
words
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    let presentWord = Word(level: 0, myWord: begin)
    var queue:[Word] = [presentWord]
    var visited:[Word] = []
    while !queue.isEmpty {
        let first = queue.remove(at: 0)
        if first.level != 0 {
            visited.removeSubrange((first.level-1)...)
        }
        visited.append(first)
        
        for word in words {
            var count = 0
            if !visited.contains(where: { (value) -> Bool in value.myWord == word }) || first.myWord != word {
                let arrayPresent = first.myWord.map{$0}
                let arrayNowWord = word.map{$0}
                for (row,charac) in arrayPresent.enumerated() {
                    if arrayNowWord[row] != charac {
                        count += 1
                    }
                    if count > 1 {
                        break
                    }
                }
                if count == 1 {
                    queue.append(Word(level: first.level+1, myWord: word))
                    if word == target {
                        return first.level+1
                    }
                }
            }
        }
        
        
    }
    return 0
}

solution("hit", "cog", words)



