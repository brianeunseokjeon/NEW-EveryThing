import UIKit



//프로그래머스 탐욕법 -> 체육복(레벨1)
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var havingTrainingClothesCount = n - lost.count
    var lostArray = lost.sorted()
    var reserveArray = Set(reserve)
    
    // 체육복을 잃어버렸지만 여유분 있는 사람 제거.
    for num in lostArray {
        if reserveArray.contains(num) {
            havingTrainingClothesCount += 1
            reserveArray.remove(num)
            lostArray.remove(at: lostArray.firstIndex(of: num)!)
        }
    }
    
    while !lostArray.isEmpty {
        let lostNum = lostArray.remove(at: 0)
         
        if reserveArray.contains(lostNum-1) {
            reserveArray.remove(lostNum-1)
            havingTrainingClothesCount += 1
        } else if reserveArray.contains(lostNum+1){
            reserveArray.remove(lostNum+1)
            havingTrainingClothesCount += 1
        }
    }
    return havingTrainingClothesCount
}
let lost = [2,3,4]
//let lost2 = [3]
//let reserve = [1,3,5]
//let reserve2 = [3]
let reserve3 = [1,2,4]
//solution(5, [2,3,4], [2,3,4])



solution(8, lost, reserve3)
