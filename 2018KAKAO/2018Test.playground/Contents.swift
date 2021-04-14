import UIKit

var str = "Hello, playground"
enum ABC: Int, CaseIterable {
    case sun,mon,tues,wed,thur,fri,satur
}
ABC.allCases.randomElement()


let line =  [
    "2016-09-15 20:59:57.421 0.351s",
    "2016-09-15 20:59:58.233 1.181s",
    "2016-09-15 20:59:58.299 0.8s",
    "2016-09-15 20:59:58.688 1.041s",
    "2016-09-15 20:59:59.591 1.412s",
    "2016-09-15 21:00:00.464 1.466s",
    "2016-09-15 21:00:00.741 1.581s",
    "2016-09-15 21:00:00.748 2.31s",
    "2016-09-15 21:00:00.966 0.381s",
    "2016-09-15 21:00:02.066 2.62s"
]

//추석 트래픽; // 시간이 있는 경우는 무조건 초로 다룬다!
func solution(_ lines:[String]) -> Int {
    var times: [(begin:Double,end:Double)] = []
    
    for line in lines {
        let splitSpace = line.split(separator: " ")
        let splitColone = splitSpace[1].split(separator: ":")
        let duringTime = Double(splitSpace[2].split(separator: "s").first!)!
        
        
        
        var endTime = Double(splitColone[0])! * 3600 + Double(splitColone[1])! * 60 + Double(splitColone[2])!
        if Double(splitColone[0]) == 0 {
            endTime += 24.0 * 3600
        }
        let begin = endTime - duringTime + 0.001
        times.append((begin:begin,end:endTime))
        
    }
    
    var _result = 0
    for _time in times {
        let end = _time.end
        var result = 0
        for time in times {
            if (time.begin >= end && time.begin < end + 1) ||   // 시작시간이 1초 안에 있는 경우
                ((time.end >= end && time.end < end + 1)) ||    // 끝시간이 1초 안에 있는 경우
                (time.begin < end && time.end >= end + 1) {     // 시작시간이 1초 전이고 끝시간이 1초 이후인 경우
                result += 1
            }
        }
        if result > _result {
            _result = result
        }
    }
    return _result
}


//[1차] 비밀지도 이진수로 바꾸기 문제!-_-ㅎ
func solution1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result = [Int]()
    var answer = [String]()
    arr1.enumerated().forEach{ (index,value) in
        //비트와이스 핵심..;
        result.append(value | arr2[index])
    }
    
    for value in result {
        var length = 0
        var str = ""
        var tempValue = value
        while length < n {
            length += 1
            if tempValue % 2 == 1 {
                str = "#" + str
            } else {
                str = " " + str
            }
            tempValue = tempValue / 2
        }
        answer.append(str)
    }
    return answer
}

    
solution1(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
    
solution1(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 1])


func solution1111(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        var bitwise = String(arr1[i] | arr2[i], radix: 2)
        bitwise = String(repeating: "0", count: n-bitwise.count) + bitwise
        answer += [""]
        for b in bitwise {
            answer[i] += b == "1" ? "#" : " "
        }
    }

    return answer
}


//다트게임 포인트는? 일일이 하는거???

func solution22(_ dartResult:String) -> Int {
    var points = [0,0,0]
    var index = -1

    var previous: Character = " "
    for input in dartResult {
        print("현재 인덱스 :",index, "현재 값 :",input)
        switch input {
        case "S" :
            points[index] = Int(pow(Double(points[index]), 1))
        case "D" :
            points[index] = Int(pow(Double(points[index]), 2))
        case "T" :
            points[index] = Int(pow(Double(points[index]), 3))
        case "*" :
            if index-1 >= 0 {
                points[index-1] *= 2
            }
            points[index] *= 2
        case "#" :
            points[index] *= -1
        default:
            if previous == "1" {
                points[index] = 10
            } else {
                index += 1
                points[index] = Int(String(input))!
            }
        }
        previous = input
    }

    var result: Int = 0
    for point in points {
        result += point
    }

    return result
}

//solution22("1S2D*3T")


func solution333(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cacheContainer:[String] = []
    
    func cacheProcess(size:Int, cacheContainer:[String],item:String,isContain:Bool = false) -> [String] {
        var tempContainer = cacheContainer
        guard size != 0 else {return []}
        if tempContainer.count < size {
            tempContainer.append(item)
        } else {
            tempContainer.append(item)
            if isContain {
                tempContainer.remove(at: tempContainer.firstIndex(of: item)!)
            } else {
                tempContainer.removeFirst()
            }
        }
        return tempContainer
    }
    
    var time = 0
    var isContain = false
    for city in cities {
        if cacheContainer.contains(city.lowercased()) {
            time += 1
            isContain = true
        } else {
            time += 5
            isContain = false
        }
        cacheContainer = cacheProcess(size: cacheSize, cacheContainer: cacheContainer, item: city.lowercased(),isContain: isContain)
        isContain = false
    }
    return time
}

//let f = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
//let f = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]
//let f = (2,["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"])
//let f = (5,["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"])
//let f = (2,["Jeju", "Pangyo", "NewYork", "newyork"])
let f = (0,["Jeju", "Pangyo", "Seoul", "NewYork", "LA"])

//solution333(f.0, f.1)


//뉴스 클러스터링


func solution1(_ str1:String, _ str2:String) -> Int {
    func changeToArrStr(str:String) -> [String:Int] {
        let arrayStr = str.lowercased().map{$0}
        var resultArray = [String:Int]()
        var index = 0
        
        while index < arrayStr.count - 1 {
            if arrayStr[index].isLetter && arrayStr[index+1].isLetter {
                let word = String(arrayStr[index]) + String(arrayStr[index+1])
                if resultArray[word] == nil {
                    resultArray.updateValue(1, forKey: word)
                } else {
                    resultArray[word]! += 1
                }
                
            }
            index += 1
        }
        return resultArray
    }
    let stack1 : [String : Int] = changeToArrStr(str: str1)
    let stack2 : [String : Int] = changeToArrStr(str: str2)
    var same = 0
    var all = 0
    var keySet = Set<String>()
    
    stack1.keys.forEach{keySet.insert($0)}
    stack2.keys.forEach{keySet.insert($0)}

    for key in keySet {
        if let first = stack1[key], let second = stack2[key] {
            same += min(first,second)
            all += max(first,second)
        } else if let first = stack1[key] {
            all += first
        } else if let second = stack2[key] {
            all += second
        }
    }
    if all == 0 {
        return 65536
    }
    
    return Int((Double(same) / Double(all)) * 65536)
}

//let fir1 = ("FRANCE","french")
//let fir1 = ("handshake","shake hands")
//let fir1 = ("aa1+aa2","AAAA12")
let fir1 = ("E=M*C^2","e=m*c^2")

//solution1(fir1.0,fir1.1)




// 스트링으로 알파벳.체크
extension String {
  var isAllAlphabet: Bool {
    return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
  }
}

"abcd ".isAllAlphabet
