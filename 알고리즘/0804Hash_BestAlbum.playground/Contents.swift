import UIKit
//[classic, pop, classic, classic, pop]    [500, 600, 150, 800, 2500]    [4, 1, 3, 0]
//스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.
//1. 합이 가장 많이 재생된 장르 먼저 -> 그 장르안에서 노래가 가장 많이 수록 -> 횟수가 같으면 빠른 고유번호

var so = [(100,3),(100,1),(200,5),(200,11),(100,2)]
var h = so.sorted { (first, second) -> Bool in
    if first.0 > second.0 {
        return true
    } else if first.0 == second.0 {
        return first.1 < second.1
    } else {
        return false
    }
}

//배울점.. 튜플에 이름 넣어주자.

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var Album = [String:[(musicIndex:Int,musicCount:Int)]]()
    var saveCount = [String:Int]()
    var result = [Int]()
    for index in 0..<genres.count {
        if Album[genres[index]] == nil {
            
            Album.updateValue([(index,plays[index])], forKey: genres[index])
            saveCount.updateValue(plays[index], forKey: genres[index])
            
        } else {
            if Album[genres[index]]?.count == 2 {
                
                Album[genres[index]]?.sort(by: { (first, second) -> Bool in
                    return first.musicCount > second.musicCount
                })
                if Album[genres[index]]![1].musicCount < plays[index] {
                    Album[genres[index]]!.remove(at: 1)
                    Album[genres[index]]?.append((index,plays[index]))
                }
                    
            } else if Album[genres[index]]?.count == 1 {
                Album[genres[index]]?.append((index,plays[index]))
            }
            //공통으로 합은 추가
             saveCount[genres[index]]! += plays[index]
            
        }
    }
    saveCount
        .sorted { $0.value > $1.value}
        .forEach{
            Album[$0.key]?.sort{$0.musicCount > $1.musicCount}
            result += (Album[$0.key]!.map{ $0.musicIndex })
    }

//    for s in save {
//        Album[s.key]?.sort(by: { (first, second) -> Bool in
//            return first.musicCount > second.musicCount
//        })
//        for x in Album[s.key]! {
//            result.append(x.0)
//        }
//    }
    
    
    return result
}

solution(["classic","pop","classic","classic","pop","classic"], [500,600,150,800,2500,800])
solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 501, 800, 900])//[3, 2, 4, 1]


//코드가 깔끔.
//func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
//    var playList = [String:(play: Int, music: [Int:Int])]()
//    var answer = [Int]()
//
//    for (index, value) in genres.enumerated() {
//        if let genre = playList[value]?.play {
//            playList[value]?.play = genre + plays[index]
//            playList[value]?.music[index] = plays[index]
//        } else {
//            playList[value] = (play: plays[index], music: [index:plays[index]])
//        }
//    }
//
//    let rank = playList.sorted(by: { $0.value.play > $1.value.play })
//
//    rank.forEach { song in
//        let songRank = song.value.music.sorted { $0.value > $01.value }
//
//        let max = songRank.count > 1 ? 2 : 1
//        for i in 0..<max {
//            answer.append(songRank[i].key)
//        }
//    }
//
//    return answer
//}
