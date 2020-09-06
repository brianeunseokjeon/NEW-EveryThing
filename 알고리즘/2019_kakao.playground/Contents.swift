import UIKit

//2019 카카오_오픈채팅방
let b = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

func solution1(_ record:[String]) -> [String] {
    var answer:[String] = []
    var userList: [String:String] = Dictionary<String,String>()
    
    for i in record {
        let type = i.split(separator: " ")[0]
        let id = String(i.split(separator: " ")[1])
        if type == "Enter" || type == "Change" {
            userList.updateValue(String(i.split(separator: " ")[2]), forKey: id)
        }
    }
    
    for i in record {
        let type = i.split(separator: " ")[0]
        let id = String(i.split(separator: " ")[1])
        if type == "Enter" {
            answer.append(userList[id]! + "님이 들어왔습니다.")
        } else if type == "Leave" {
            answer.append(userList[id]! + "님이 나갔습니다.")
        }
    }
    
    return answer
}
//solution1(b)

// 실패율
func solution2(_ N:Int, _ stages:[Int]) -> [Int] {
    var answer: [Int:Double] = [:]
    var length = Double(stages.count)
    for stage in (1...N) {
        let count = Double(stages.filter{ stage == $0 }.count)
        var fail = 0.0
        if length == 0 {
            fail = 0
        } else {
            fail = count / length
        }
        answer.updateValue(fail, forKey: stage)
        length -= count
    }
   let f = answer.sorted { (arg0, arg1) -> Bool in
        if arg0.value == arg1.value {
            return arg0.key > arg1.key
        }
        return arg0.value < arg1.value

   }.map{$0.key}.reversed().map{$0}
    return f
}
//solution2(5,[2, 1, 2, 6, 2, 4, 3, 3])
//solution2(4, [4,4,4,4,4])



//후보키

func comb(initArr:[Int],arr:[Int],index:Int ,n:Int, r:Int,target:Int) {
    var array = arr
    if r == 0 {
        resultContainerArray.append(array)
    } else if target == n {
        return
    } else {
        array[index] = initArr[target]
        comb(initArr: initArr, arr: array, index: index+1, n: n, r: r-1, target: target+1)
        comb(initArr: initArr, arr: array, index: index, n: n, r: r, target: target+1)
    }
    
}

var resultContainerArray:[[Int]] = []


func isUnique(input:[[String]]) -> [[Int]] {
    var uniqueArray = [[Int]]()
    for arr in resultContainerArray {
        var tempSet:Set<String> = []
        var isOkay = true
        for i in input {
            var temp = ""
            for x in arr {
               temp += i[x]
            }
            if tempSet.contains(temp) {
                isOkay = false
                break
            } else {
               tempSet.insert(temp)
            }
        }
        if isOkay {
            uniqueArray.append(arr)
        }
    }
    return uniqueArray
}


func solution(_ relation:[[String]]) -> Int {
    let initArr = [Int](0..<relation[0].count)
    
    for i in 1...initArr.count {
        let cho = Array<Int>.init(repeating: 0, count: i)
        comb(initArr: initArr, arr: cho, index: 0, n: initArr.count, r: i, target: 0)
    }
    

    var result = [Set<Int>]()
    let uniqueArray = isUnique(input: relation)
    for x in uniqueArray {
        let setTemp = Set(x)
        var isOkay = true
        for y in result {
            if y.isSubset(of: setTemp) {
                isOkay = false
                break
            }
        }
        if isOkay {
            result.append(setTemp)
        }
    }
    return result.count
}


let xx = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]

solution(xx)
