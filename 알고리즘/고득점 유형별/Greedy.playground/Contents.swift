import UIKit

//Greedy

//체육복

func solutionOther(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {

    // 가지고 있는 체육복 개수 저장 (기본적으로 1벌)
    var students = [Int](repeating: 1, count: n)
    
    // 잃어버린 사람은 체육복 0벌
    for l in lost {
        students[l-1] = 0
    }
    // 여벌 가져 온 사람은 +1 벌
    for r in reserve {
        students[r-1] += 1
    }
    
    var count = 0 // 체육복을 빌리지 못한 학생 수
    for i in 0..<n {
        if students[i] == 0 {
            if i>0 && students[i-1] > 1 {
                // 앞번호 학생에게 빌린다.
                students[i] = 1
                students[i-1] = 1
            } else if i<n-1 && students[i+1] > 1 {
                // 뒷번호 학생에게 빌린다.
                students[i] = 1
                students[i+1] = 1
            } else {
                // 빌리지 못했다.
                count += 1
            }
        }
    }
    
    return n - count
}



//여벌 체육복이 있는 학생(reserve)은 무조건 내 앞 번호 학생(reserve - 1)에게 빌려준다!
//만약 내 앞 번호 학생이 체육복이 있으면(lost에 없으면), 내 뒷 번호 학생(reserve + 1)에게 빌려준다!
//내 뒷 번호 학생(reserve + 1)도 체육복이 있으면 안 빌려주면 된다!


func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    //차집합 사용 (교집합이 없어야 함)
    var lostSet = Set(lost).subtracting(reserve)
    let reserveSet = Set(reserve).subtracting(lost)
    for canBorrow in reserveSet {
        if lostSet.contains(canBorrow-1) {
            lostSet.remove(canBorrow-1)
            continue
        }
        if lostSet.contains(canBorrow+1) {
            lostSet.remove(canBorrow+1)
        }
    }
    return n-lostSet.count
}
//let greedy1 = (5,[2,4],[1,3,5])
//let greedy1 = (5,[2,4],[3])
//let greedy1 = (3,[3],[1])
//let greedy1 = (2,[2],[2])
let greedy1 = (4,[3,1],[4,2])

//solution(greedy1.0, greedy1.1, greedy1.2)
//ABCDEFGHUJ K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z
//012345678910 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25



// 못풀었엄..
func solution(_ name:String) -> Int {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
    var dic = Dictionary<String,Int>()
    alphabet.enumerated().forEach{dic.updateValue(min($0.offset,alphabet.count - $0.offset), forKey: $0.element)}
    let name = name.map{String($0)}
    var count = 0
    var notAindexArray = [Int]()
    for (idx,alphabet) in name.enumerated() {
        count += dic[alphabet]!
        if alphabet != "A" {
            notAindexArray.append(idx)
        }
    }
//         "BBAAABA"
//         0,1,5 .다음A 가아닌 인덱스가 5이니깐 앞으로는 +4(다음인덱스-현재인덱스), -> 거꾸로는 3(index+totalcount - 다음인덱스)
    var currentIndex = 0
    for index in 0..<notAindexArray.count {
       let nextIndex = notAindexArray[index]
       let rightValue = nextIndex-currentIndex
        let reverseValue = currentIndex+name.count-nextIndex
        
        if rightValue > reverseValue {
            count += (currentIndex + reverseValue)
            break
        } else {
            currentIndex = nextIndex
        }
        
        if index == notAindexArray.count - 1 {
            count += notAindexArray[index]
        }
       
    }
    return count
}

//let name = "JAZ" // 11
//let name = "JEROEN" //56
//let name = "JAN" //23
//let name = "AAA"
//let name = "BBBAAAB" //BBB 하고 왼쪽으로가서 B 9
//let name = "BBAAABA"//
let name = "ABABAAAAAB"
//solution(name)



func solution(_ number:String, _ k:Int) -> String {
    var remover = k
    let numberArray = number.map{String($0)}
    var result = ""
    for num in numberArray {

      
        if result.isEmpty || remover < 1 {
            result += num
        } else {
            var isStop = false

            while isStop == false && remover > 0 {

                guard !result.isEmpty else {
                    result += num
                    break
                }
                if String(result.last!) >= num {
                    isStop = true
                    result += num
                    
                } else {
                    result.removeLast()
                    remover -= 1
                    if remover == 0 {
                        result += num
                    }
                }
            }
            
            
            
        }
    }
    
    while remover > 0 {
        remover -= 1
        result.removeLast()
    }
    
    
    return result
}

//
//solution("7777", 2)

//인프런 회의실 배정문제
func maxConference(_ conferenceConut:Int, times: [[Int]]) -> [[Int]] {
    let conferenceTimes = times.sorted { $0[1] < $1[1] }
    var beforeEndTime = 0
    var resultMeeting = [[Int]]()

    for x in conferenceTimes {
        if beforeEndTime <= x[0] {
            resultMeeting.append(x)
            beforeEndTime = x[1]
        }
    }
    return resultMeeting
}

let conference = (5 , [[1,4],[2,3],[3,5],[4,6],[5,7]])
//maxConference(conference.0, times: conference.1)



