import UIKit

//hash -> 딕셔너리로 해결해보자
func solution(_ clothes:[[String]]) -> Int {
    var clothesDic: [String:[String]] = [:]
    for dress in clothes {
        let cloth = dress[0]
        let kind = dress[1]
        if clothesDic[kind] == nil {
            clothesDic.updateValue([cloth], forKey: kind)
        } else {
            clothesDic[kind]!.append(cloth)
        }
    }

    var answer = 1
    
    for x in clothesDic.values {
       answer *= (x.count + 1)
    }
    
    
    return answer - 1
}

solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])
