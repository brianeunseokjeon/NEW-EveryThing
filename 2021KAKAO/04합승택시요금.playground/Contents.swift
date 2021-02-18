import UIKit

var str = "Hello, playground"

//그래프 문제는 플로이드 워샬로 풀어보자,

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var distance = Array(repeating: Array(repeating: 100000, count: n), count: n)
    for x in 0..<n {
        distance[x][x] = 0
    }
    for fare in fares {
       
        distance[fare[0]-1][fare[1]-1] = fare[2]
        distance[fare[1]-1][fare[0]-1] = fare[2]
    }
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                distance[i][j] = min(distance[i][j],distance[i][k]+distance[k][j])
            }
        }
    }

    var answer = 100000000
    // 브루트 포스?? 몬지모름..;; (합승했을때 이렇게 하면 되는 듯...)
    for i in 0..<n {
        answer = min(answer,distance[s-1][i]+distance[i][a-1]+distance[i][b-1])
    }

    return answer
}
solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]])
