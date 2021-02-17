import UIKit



func combination(str:String,selectCount:Int,currentIndex:Int,selectSet:Set<Character>) {
    
    
}


//중복조합
func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }
    
    guard let first = elements.first else {
        return []
    }
    
    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(), k: k)
    
    return ret
}

func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
    return combos(elements: ArraySlice(elements), k: k)
}

//extension RangeReplaceableCollection {
//    func combinations(of n: Int) -> [SubSequence] {
//        guard n > 0 else { return [.init()] }
//        guard let first = first else { return [] }
//        return combinations(of: n - 1).map { CollectionOfOne(first) + $0 } + dropFirst().combinations(of: n)
//    }
//    func uniqueCombinations(of n: Int) -> [SubSequence] {
//        guard n > 0 else { return [.init()] }
//        guard let first = first else { return [] }
//        return dropFirst().uniqueCombinations(of: n - 1).map { CollectionOfOne(first) + $0 } + dropFirst().uniqueCombinations(of: n)
//    }
//}
//
//["a","b","c"].uniqueCombinations(of: 1)
func combinations<T>(source: [T], takenBy : Int) -> [[T]] {
    guard source.count >= takenBy else{return []}
    
    if(source.count == takenBy) {
        return [source]
    }
    
    if(source.isEmpty) {
        return []
    }
    
    if(takenBy == 0) {
        return []
    }
    
    if(takenBy == 1) {
        return source.map { [$0] }
    }
    
    
    var result : [[T]] = []
    
    let rest = Array(source.suffix(from: 1))
    let subCombos = combinations(source: rest, takenBy: takenBy - 1)
    let myCombos = combinations(source: rest, takenBy: takenBy)
    result += subCombos.map { [source[0]] + $0 }
    result += myCombos
    return result
}
//combinations(source: [1,2,3,4], takenBy: 3)


func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var dic = [Set<String.Element>:Int]()
    var resultDic = [Int:Int]()
    var result = [String]()
    for count in course {
        resultDic.updateValue(1, forKey: count)
        for order in orders {
            for x in combinations(source: Array(order), takenBy: count) {
                let changeSet = Set(x)
                if dic[changeSet] == nil {
                    dic.updateValue(1, forKey: changeSet)
                } else {
                    dic[changeSet]! += 1
                    resultDic[count] = max(resultDic[count]!,dic[changeSet]!)
                }
            }
            
        }
    }
    for (key,value) in dic {
        if value == 1 {
            continue
        } else {
            if resultDic[key.count] == value {
                result.append(key.sorted().map{String($0)}.joined())
            }
        }
        
    }
    return result.sorted()
}

solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"],[2,3,4])
