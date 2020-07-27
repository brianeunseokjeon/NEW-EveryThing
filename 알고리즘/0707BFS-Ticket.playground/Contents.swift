import UIKit

//7.6 ~ 7.7 마무리
//프로그래머스 - 깊이/너비 우선 탐색(DFS/BFS) - 여행경로
struct Route:Equatable {
    let myIndex: Int
    let preIndex: Int?
    let starting: String
    let landing: String
}

func solution(_ tickets:[[String]]) -> [String] {
    // 처음 스텍값을 임의로 넣어둠
    var stack:[Route] = [Route(myIndex: -1, preIndex: nil, starting: "", landing: "ICN")]
    // 무조건 시작은 ICN이므로 넣어둠. 그리고 답은 landing값만 추가하는 것으로..
    var solution:[String] = ["ICN"]
    var visit:[Int] = []
    
    while !stack.isEmpty {
        let airplainTicketRoute = stack.remove(at: 0)
        if airplainTicketRoute.preIndex != nil {
            if airplainTicketRoute.preIndex != visit.last {
                let first = visit.firstIndex(of: airplainTicketRoute.preIndex!)! + 1
                if first <= visit.count - 1 {
                    // let c = [["ICN","B"],["B","C"],["B","D"],["D","B"],["C","P"]]
                    // 스텍에 [0] -> visit:[0] stack: [1,2] -> visit:[0,1] stack:[4,2] -> visit:[0,1,4] 일경우 stack[2] stack에 추가되는 값없이..이때 , 밑에 코드에 의해 visit의 4가 삭제될것이고, 인덱스 2값의 preIndex 가 0 이므로, visit에 0이 속한 0번째 인덱스 다음인 인덱스들은 삭제할 필요가 있다. 그래서 first 코드를 만들어서 밑의 코드가 탄생.
                    visit.removeSubrange(first...)
                }
            }
        }
        guard !visit.contains(airplainTicketRoute.myIndex) else {continue}
        //처음 airplainTicket이 myIndex == -1 값인 초기값을 넣어두었기에 밑에 if값이 필요..ㅠㅠ
        if airplainTicketRoute.myIndex != -1 {
            visit.append(airplainTicketRoute.myIndex)
        }
        
        var tempInsert:[Route] = []
        for (index,ticket) in tickets.enumerated() {
            guard !visit.contains(index) else { continue }
            let next = airplainTicketRoute.landing
//            print("next :",next ,"ticket :",ticket[0])
            if ticket[0] == next {
                tempInsert.insert(Route(myIndex: index, preIndex: visit.last, starting: ticket[0], landing: ticket[1]), at: 0)
                //tempInsert 없이는 stack에 추가할때, 앒파벳 순서가 빠른 경로를 앞에 추가시켜야 되는데 그럴수 없어서 tempInsert 추가하여 해결함.
            }
                
        }
        //만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 구하기위해 정렬해서 스텍에 추가함. -> 앞선 경로를 통해 답이 나오면 3번
        tempInsert.sort { (first, second) -> Bool in
            return first.landing < second.landing
        }
        for x in tempInsert.reversed() {
            stack.insert(x, at: 0)
        }
        
        //3번 -> 앞선 경로가 나오면 바로 리턴해버림.
        if visit.count == tickets.count {
            for index in visit {
                solution.append(tickets[index][1])
               }
            return solution
        }
        if tempInsert.count == 0 {
            visit.removeLast()
        }
        print("visit :",visit)
//        print("stack :",stack)
        
    }
    return solution
}

//tickets = [['ICN','BOO' ], [ 'ICN', 'COO' ], [ 'COO', 'DOO' ], ['DOO', 'COO'], [ 'BOO', 'DOO'] ,['DOO', 'BOO'], ['BOO', 'ICN' ], ['COO', 'BOO']]
//을 입력으로 둘 때,
//결과 값이 ['ICN', 'BOO', 'DOO', 'BOO', 'ICN', 'COO', 'DOO', 'COO', 'BOO']

let ff = [["ICN","BOO"], ["ICN", "COO"], [ "COO", "DOO" ], ["DOO", "COO"], [ "BOO", "DOO"] ,["DOO", "BOO"], ["BOO", "ICN" ], ["COO", "BOO"]]
let g = [["ICN", "SFO"], ["SFO", "ICN"], ["ICN", "SFO"],["SFO","QRE"]]



// 처음엔 1,2번 케이스 성공못하고 에러떠서 무엇이 문제인지 알수 없었으나, stack에 값이 없을때까지 while 구문 돌려! 했는데 조건을 추가 안해서 스텍의 값이 0이 되지않는 현상이 발생하여 오류 났었음. 추가로 밑에 두 코드가 성공하니 성공됨.

//1번케이스 - 동일한 표 2개 이상일때
let d = [["ICN","B"],["B","ICN"],["ICN","B"]] //결과: ["ICN", "B", "ICN", "B"]

//2번케이스 - 처음 시작했을 때,
let h = [["ICN","D"],["D","ICN"],["ICN","A"]] //결과: ["ICN", "D", "ICN", "A"]
let f = [["ICN","A"],["A","B"],["B","A"],["A","ICN"],["ICN","A"]] //결과: ["ICN", "A", "B", "A", "ICN", "A"]




// 그래도 추가로 테스트 케이스를 넣어두겠습니다.
let a = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
let b = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
let c = [["ICN","B"],["B","C"],["B","D"],["D","B"],["C","P"]] //결과: ["ICN", "B", "D", "B", "C", "P"]


solution(c)
