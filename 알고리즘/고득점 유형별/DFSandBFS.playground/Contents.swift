import UIKit


//DFS 레벨1단계
var save = 0
func sol(_ numbers:[Int],_ current:Int,_ target: Int) {
    var numbers = numbers
    var current = current
    if numbers.isEmpty {
        if target == current {
            save += 1
        }
    } else {
        let removeFirst = numbers.removeFirst()
        current += removeFirst
        sol(numbers, current, target)
        current -= removeFirst
        current -= removeFirst
        sol(numbers, current, target)
    }
    
}


func solution(_ numbers:[Int], _ target:Int) -> Int {
    sol(numbers, 0, target)
    return save
}

var clo = { (input) -> Int in
    return input * 10
}

[1,3,4,5,6,7].map(clo)

//bfs 레벨 2단계 - 네트워크 -> 내가 못품


func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array.init(repeating: false, count: n)
    var answer = 0
    
    func bfs(_ vertex:Int) {
        visited[vertex] = true
        for i in 0..<n {
            if computers[vertex][i] == 1 && visited[i] == false {
                bfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if visited[i] == false {
            answer += 1
            bfs(i)
        }
    }
    
    return answer
}

//let network = (3,[[1, 1, 0], [1, 1, 0], [0, 0, 1]])
//let network = (3,[[1, 1, 0], [1, 1, 1], [0, 1, 1]])
let network = (6, [[1, 0, 1, 1, 0, 0], [0, 1, 0, 0, 1, 1], [1, 0, 1, 1, 1, 1], [1, 0, 1, 1, 1, 1], [0, 1, 1, 1, 1, 1], [0, 1, 1, 1, 1, 1]])
//solution(network.0, network.1)



func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array.init(repeating: (level:0,isVisit:false), count: words.count)
    var queue = [begin]
    var currentLevel = 0
    var isEnding = false
    
    while !queue.isEmpty {
        let currentWord = queue.removeFirst()
//        print("현재 단어 :",currentWord,"방문 :",visited)
        
        // 현재단어의 레벨.
        if words.contains(currentWord) {
            let index = Int(words.firstIndex(of: currentWord)!)
            currentLevel = visited[index].level
        }
        
        if target == currentWord {
            isEnding = true
            break
        }
        
        for (idx,word) in words.enumerated() {
            var difCount = 0
            
            // 현재단어와, 비교단어가 1개만 스펠링달라야함
            for i in 0..<word.count {
                if word[word.index(word.startIndex, offsetBy: i)] != currentWord[currentWord.index(currentWord.startIndex, offsetBy: i)] {
                    difCount += 1
                }
                if difCount > 1 {
                    continue
                }
            }
            
            // 만약 스펠링이 1개다르고 방문하지 않았더라면 지금 큐에 넣는다.
            if difCount == 1 && visited[idx].isVisit == false {
                queue.append(word)
                visited[idx] = (currentLevel+1,true)
            }
            
        }
    }

    if isEnding == false {
        return 0
    } else {
        return currentLevel
    }

}
let word = ("hit","cog",["hot", "dot", "dog", "lot", "log"])
//solution(word.0, word.1, word.2)



//ICN이 항상 출발지점
func solution(_ tickets:[[String]]) -> [String] {
    var visited = Array.init(repeating: false, count: tickets.count)
    var resultValue = [[String]]()
    
    
    func DFS(result:[String]) {
        var result = result
        let nowPoint = result.last
        
        
        if tickets.count + 1 == result.count {
            resultValue.append(result)
        }
        
        
        
    }
    
    DFS(result: ["ICN"])

    resultValue.sort { (first, second) -> Bool in
       return first.reduce("") { $0 + $1 } <  second.reduce("") { $0 + $1 }
    }
    
    print(resultValue)
    return resultValue.first!
}
//let ticket = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
let ticket = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
solution(ticket)

