import UIKit

var str = "Hello, playground"
["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]

let df = DateFormatter()
df.dateFormat = "HH:mm:ss"
var h = "99:20:15"
var g = df.date(from: h)?.addingTimeInterval(44)

//df.string(from: g!)
//func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
//
//    func changeToSeconds(time:String) -> Int {
//        let splitTime = time.split(separator: ":")
//        let totalTime = Int(splitTime[0])! * 3600 + Int(splitTime[1])! * 60 + Int(splitTime[2])!
//        return totalTime
//    }
//
//    func changeToLogs(times:[String]) -> [(start:Int,end:Int)] {
//        let sortTimes = times.sorted()
//        var result = Array<(start:Int,end:Int)>()
//        for time in sortTimes {
//           let h = time.split(separator: "-")
//            result.append((changeToSeconds(time: String(h[0])),changeToSeconds(time: String(h[1]))))
//        }
//        return result
//    }
//
//    func timeToString(second:Int) -> String {
//        var res = ["","",""]
//        let hour = second / 3600
//        let minute = (second % 3600) / 60
//        let second = second % 60
//
//        if hour > 10 {
//            res[0] = "\(hour)"
//        } else {
//            res[0] = "0\(hour)"
//        }
//
//
//        if minute > 10 {
//            res[1] = "\(minute)"
//        } else {
//            res[1] = "0\(minute)"
//        }
//
//        if second > 10 {
//            res[2] = "\(second)"
//        } else {
//            res[2] = "0\(second)"
//        }
//        return res[0]+":"+res[1]+":"+res[2]
//    }
//
//    let myPlayTime = changeToSeconds(time: play_time)
//    let myAdvTime = changeToSeconds(time: adv_time)
//    let mylogs = changeToLogs(times: logs)
//    let lastIndex = logs.count - 1
//
//    if myAdvTime >= myPlayTime {
//        return "00:00:00"
//    }
//    if mylogs[0].start + myAdvTime >= myPlayTime {
//        return timeToString(second: myPlayTime - myAdvTime)
//    }
//
//    var maxAdTimeStart = timeToString(second: mylogs[0].start)
//    var maxAdTime = 0
//
//    for index in 0...lastIndex {
//        let adTimeStart = mylogs[index].start
//        let adTimeEnd = mylogs[index].start + myAdvTime
//        var tempAdTime = 0
//        for i in 0...lastIndex {
//            let currentTime = mylogs[i] // 현재 재생 시작,끝
//            let didEndAdTime = (adTimeStart + myAdvTime)  //광고 끝나는 시간
//            let currentAdRunningTime = currentTime.end - currentTime.start // 재생 총 시간
//            guard currentTime.start <= adTimeEnd && adTimeEnd <= currentTime.end else { continue }
////            print("######## 현재 재생 시간 ######### ",timeToString(second: currentTime.start),timeToString(second: currentTime.end))
////            print("현재 광고 시작 시간 ",timeToString(second: adTimeStart))
//
//            if adTimeStart == currentTime.start {
//                tempAdTime += didEndAdTime > currentTime.end ? currentAdRunningTime : myAdvTime
////                print("현재 광고시간과 현재시간이같고, 끝나는 시간이 더길어? : ", didEndAdTime > currentTime.end ,"그러면 러닝 타임 몇이야?",didEndAdTime > currentTime.end ? currentAdRunningTime : myAdvTime )
//            } else if adTimeStart > currentTime.start {
//                //여기는 광고시간이 나중
//                let remainRunningTime = currentTime.end - adTimeStart
//                tempAdTime += remainRunningTime > myAdvTime ? myAdvTime : remainRunningTime
//                //여기는 광고시간이 먼저
////                print("여기는 광고 마지막:::::::",remainRunningTime,remainRunningTime > myAdvTime ? myAdvTime : remainRunningTime)
//
//            } else {
//                let deleteAdTime = currentTime.start - adTimeStart
//                let remainAdTime = myAdvTime - deleteAdTime
//                let remainDidEndAdTime = currentTime.start + remainAdTime
//                tempAdTime += remainDidEndAdTime > currentTime.end ? currentAdRunningTime : remainAdTime
////                print("현재 광고 시작시간 ,",timeToString(second: adTimeStart))
////                print("현재 광고시간이 더 빠를때야!! :",remainDidEndAdTime > currentTime.end ,"더하는 시간이 몇이야 ?",remainDidEndAdTime > currentTime.end ? currentAdRunningTime : remainAdTime)
//
//            }
//
//        }
////        print("일시적! :",timeToString(second: tempAdTime),"현재 최고값 :",timeToString(second: maxAdTime))
//        if tempAdTime > maxAdTime {
//            maxAdTime = tempAdTime
//            maxAdTimeStart = timeToString(second: adTimeStart)
//        }
//
//        maxAdTime = max(maxAdTime,tempAdTime)
//    }
//
//
//
//
//    return maxAdTimeStart
//}

//solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"])


//solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"])


//solution("50:00:00", "50:00:00", ["15:36:51-38:21:49", "10:14:18-15:36:51", "38:21:49-42:51:45"])


func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    func changeToSeconds(time:String) -> Int {
        let splitTime:[String.SubSequence] = time.split(separator: ":")
        let totalTime:Int = Int(splitTime[0])! * 3600 + Int(splitTime[1])! * 60 + Int(splitTime[2])!
        return totalTime
    }
    
    func changeToLogs(times:[String]) -> [(start:Int,end:Int)] {
//        let sortTimes:[String] = times.sorted()
       
        var result:[(start: Int, end: Int)] = Array<(start:Int,end:Int)>()
        for time in times {
            let h: [String.SubSequence] = time.split(separator: "-")
            let timeStart = changeToSeconds(time: String(h[0]))
            let timeLast = changeToSeconds(time: String(h[1]))
            result.append((timeStart,timeLast))
        }
        return result
    }
    
    func timeToString(second:Int) -> String {
        var res: [String] = ["","",""]
        let hour: Int = second / 3600
        let minute: Int = (second % 3600) / 60
        let second: Int = second % 60
        
        if hour > 10 {
            res[0] = "\(hour)"
        } else {
            res[0] = "0\(hour)"
        }
        
        if minute > 10 {
            res[1] = "\(minute)"
        } else {
            res[1] = "0\(minute)"
        }
        
        if second > 10 {
            res[2] = "\(second)"
        } else {
            res[2] = "0\(second)"
        }
        return res[0]+":"+res[1]+":"+res[2]
    }
    
    
    var resultArray: [Int] = Array(repeating: 0, count: 360001)
    var resultSumArray: [Int] = Array(repeating: 0, count: 360001)
    let myPlayTime: Int = changeToSeconds(time: play_time)
    let myAdvTime: Int = changeToSeconds(time: adv_time)
    let mylogs: [(start: Int, end: Int)] = changeToLogs(times: logs)
    
    
    if myPlayTime <= myAdvTime {
        return "00:00:00"
    } else if (myPlayTime - mylogs[0].start) < myAdvTime  {
        return timeToString(second: myPlayTime - myAdvTime)
    }
    var last:Int = 0
    for playTime in mylogs {
        last = max(playTime.end,last)
        
        for x in playTime.start+1...playTime.end {
            resultArray[x] += 1
        }
    }
    
    for x in 1...360000 {
        resultSumArray[x] = resultSumArray[x-1] + resultArray[x]
    }
    

    var maxSum:Int = 0
    var maxSumAdStartTime:Int = mylogs[0].start
    
    for startTime in 1...last {
        let endAdtime = startTime + myAdvTime > 360000 ? 36000 : startTime + myAdvTime
        var tempAdTime = 0
        
        tempAdTime = resultSumArray[endAdtime] - resultSumArray[startTime]
        
        if maxSum < tempAdTime {
            maxSum = tempAdTime
            maxSumAdStartTime = startTime
        }
        if endAdtime == 360000 {
            break
        }
    }
    
    
    
    
    
    return timeToString(second: maxSumAdStartTime)
    
}








//solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"])
solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"])


solution("50:00:00", "50:00:00", ["15:36:51-38:21:49", "10:14:18-15:36:51", "38:21:49-42:51:45"])
