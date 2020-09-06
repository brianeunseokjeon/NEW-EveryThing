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

