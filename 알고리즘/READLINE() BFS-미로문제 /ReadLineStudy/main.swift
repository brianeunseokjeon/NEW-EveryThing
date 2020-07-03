//
//  main.swift
//  ReadLineStudy
//
//  Created by 맥북프로에임메드 on 03/07/2020.
//  Copyright © 2020 맥북프로에임메드. All rights reserved.
//

import Foundation

struct Node:Equatable,Hashable{
    static func == (lhs: Node, rhs: Node) -> Bool {
        guard lhs.myLevel == rhs.myLevel else { return false}
        return lhs.myPoint.0 == rhs.myPoint.0 && lhs.myPoint.1 == rhs.myPoint.1
    }
    let myLevel:Int
    let myPoint:(Int,Int)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(myPoint.0)
        hasher.combine(myPoint.1)
    }
    
   
}
func BFS(N:Int,M:Int,miro:[[Int]]) {
    let solX:Int = N-1
    let solY:Int = M-1
    var visit:Set<Node> = Set<Node>()
    var queue:[Node] = [Node(myLevel: 1, myPoint: (0,0))]
    while queue.isEmpty == false {
        //큐에서 앞에서부터 삭제!
        let currentNode = queue.remove(at: 0)
        guard visit.contains(currentNode) == false else { continue }
        let level = currentNode.myLevel
        let cx = currentNode.myPoint.0
        let cy = currentNode.myPoint.1
        //완료
        if cx == solX && cy == solY {
            print("완료했습니다. 현재 레벨은 :",level)
            return
        }
        //일단 가능한 방문한곳 넣어두기.
        visit.insert(currentNode)
        
        //상: cx,cy-1 하: cx,cy+1 좌: cx-1,cy 우: cx+1,cy -> 이게 배열에서 존재하는지? 체크가 중요하다!
        //오른쪽
        if !visit.contains(Node(myLevel: level+1, myPoint: (cx+1,cy))) && cx+1 <= miro.count-1  && miro[cx+1][cy] == 1 {
            queue.append(Node(myLevel: level+1, myPoint: (cx+1,cy)))
        }
        //아래
        if !visit.contains(Node(myLevel: level+1, myPoint: (cx,cy+1))) && cy+1 <= miro[cx].count-1 && miro[cx][cy+1] == 1 {
            queue.append(Node(myLevel: level+1, myPoint: (cx,cy+1)))
        }
        //위
        if !visit.contains(Node(myLevel: level+1, myPoint: (cx,cy-1))) && cy-1 >= 0  && miro[cx][cy-1] == 1 {
            queue.append(Node(myLevel: level+1, myPoint: (cx,cy-1)))
        }
        //왼쪽
        if !visit.contains(Node(myLevel: level+1, myPoint: (cx-1,cy))) && cx-1 >= 0  && miro[cx-1][cy] == 1 {
            queue.append(Node(myLevel: level+1, myPoint: (cx-1,cy)))
        }
    }
}


let firstReadLine = readLine()!
let arr:[String] = firstReadLine.components(separatedBy: " ")
let n:Int = Int(arr[0])!
let m:Int = Int(arr[1])!
var miro = [[Int]].init(repeating: [], count: n)
for x in 0..<n {
    let miroes = readLine()!
    var miroArr = [Int]()
    for x in miroes {
        let value = "\(x)"
        miroArr.append(Int(value)!)
    }
    miro[x] = miroArr
}

BFS(N: n, M: m, miro: miro)
