import UIKit


//중요 문제 포인트는 isEnter의 값이 넣을때는 무조건 true. 그리고 밑에서 사용할때 바꿔줘야함.
func solution(_ record:[String]) -> [String] {
    var userDic = [String:(name:String,isEnter:Bool)]()
    var order:[String] = []
    var result:[String] = []
    for user in record {
        let userInfo = user.split(separator: " ")
        let userId = String(userInfo[1])
        
        if userInfo.first == "Enter" {
            let userName = String(userInfo[2])
            order.append(userId)
            if userDic[userId] == nil {
                userDic.updateValue((userName,true), forKey: userId)
            } else {
                userDic[userId]?.name = userName
            }
        } else if userInfo.first == "Leave" {
            order.append(userId)
            
        } else {
            let userName = String(userInfo[2])
            userDic[userId]?.name = userName
        }
    }
    
    for userId in order {
        let name = userDic[userId]!.name
        let isEnter = userDic[userId]!.isEnter
        
        if isEnter {
            result.append(name+"님이 들어왔습니다.")
            userDic[userId]?.isEnter = false
            
        } else {
            result.append(name+"님이 나갔습니다.")
            userDic[userId]?.isEnter = true
            
        }
    }
    return result
}


let input = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

solution(input)



//이게 해설지 풀이
func solution2(_ record:[String]) -> [String] {
    var userName = [String:String]()
    var userState:[(id:String,state:String)] = []
    var result:[String] = []
    for user in record {
        let userInfo = user.split(separator: " ")
        let userId = String(userInfo[1])
        if userInfo.first == "Enter" {
            let name = String(userInfo[2])
            userName[userId] = name
            userState.append((userId,"님이 들어왔습니다."))
        } else if userInfo.first == "Leave" {
            userState.append((userId,"님이 나갔습니다."))
        } else {
            let name = String(userInfo[2])
            userName[userId] = name
        }
    }
    for (id,state) in userState {
        result.append(userName[id]!+state)
    }
    
    return result
    
}
solution2(input)
