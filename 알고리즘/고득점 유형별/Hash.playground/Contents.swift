import UIKit

func solution(_ clothes:[[String]]) -> Int {
    let types = clothes.compactMap({ $0.last })
    print("type :",types)
    let typeSet = Set(types)
    let categories = Array(typeSet)
    
    let counts = categories.map({ category in
        return clothes.filter({ $0.last == category }).count + 1
    })
    
    return counts.reduce(1,  { $0 * $1 }) - 1
}

//solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic = [String:[(index:Int,play:Int,totalCount:Int)]]()
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]
        if dic[genre] == nil {
            dic.updateValue([(i,play,play)], forKey: genre)
        } else {
            dic[genre]![0].totalCount += play
            dic[genre]?.append((i,play,0))
        }
    }
    
    let key = dic.keys
    var sortedGenres = [(String,Int)]()
    for k in key {
        sortedGenres.append((k,dic[k]![0].totalCount))
    }

    for k in key {
        dic[k]?.sort(by: { (first, sec) -> Bool in
            if first.play > sec.play {
                return true
            } else if first.play == sec.play && first.index < sec.index {
                return true
            } else {
                return false
            }
        })
    }
    
    sortedGenres.sort { $0.1 > $1.1 }
    let g = sortedGenres.map{$0.0}
    var result = [Int]()
    for gen in g {
        var count = 0
        while count < 2 {
            result.append(dic[gen]![count].index)
            if dic[gen]!.count == 1 {
                break
            } else {
                count += 1
            }
        }
    }
    
    return result
}
