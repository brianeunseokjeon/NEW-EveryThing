import UIKit

var str = "ab1-_.~"

//정규식을 의미한다!
//2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
//    .replaceAll("[^0-9a-z_.-]",)
extension Character {
    func isChecker() -> Bool {
        if self.isLetter || self.isNumber || self == "." || self == "_" || self == "-" {
            return true
        } else {
            return false
        }
    }

}

extension String {
    func removeRepeatingDot() -> String {
        var newString:String = ""
        var isPrevDot: Bool = false
        self.forEach{ char in
            if isPrevDot && char == "." {
                return
            } else {
                newString += "\(char)"
            }
            isPrevDot = char == "." ? true : false
        }
        return newString
    }
}

//func solution(_ new_id:String) -> String {
//    var preCharacter = Character.init("`")
//    var result = ""
//
//    for (index,cha) in new_id.enumerated() {
//        if result.count == 15 {
//            break
//        }
//
//        if cha.isChecker() {
//            if (result == "" || index == 0) && cha == "." {
//                continue
//            } else {
//                if preCharacter == cha && cha == "." {
//                    continue
//                }
//                result.append("\(cha.lowercased())")
//            }
//        }
//
//        preCharacter = cha
//    }
//
//    while result.last == "." {
//        result.removeLast()
//    }
//
//    if result.isEmpty {
//        return "aaa"
//    } else if result.count <= 2 {
//        while result.count < 3 {
//            let lastValue = result.last!
//            result.append(lastValue)
//        }
//    }
//
//
//    return result
//}
public func measureTime(_ closure: () -> ()) {
    let startDate = Date()
    closure()
    print(Date().timeIntervalSince(startDate))
}
//0.036242008209228516
//0.03742504119873047


//measureTime {
//    solution("...!@BaT#*..y.abcdefghijklm")
//}

//func solution(_ new_id:String) -> String {
//    let first = new_id.lowercased()
//    let second = first.filter{$0.isChecker()}
//    var third = second.removeRepeatingDot()
//    while !third.isEmpty && third.first == "." {
//        third.removeFirst()
//    }
//    while !third.isEmpty && third.last == "." {
//        third.removeLast()
//    }
//
//    var fifth = third.isEmpty ? "a" : third
//    if fifth.count > 15 {
//        let range = fifth.index(fifth.startIndex, offsetBy: 15)..<fifth.endIndex
//        fifth.removeSubrange(range)
//    }
//    if fifth.last == "." {
//        fifth.removeLast()
//    }
//
//    while fifth.count < 3 {
//        let last = fifth.last!
//        fifth += "\(last)"
//    }
//
//    return fifth
//}

//이게 진정한 문제 의도인듯..

func solution(_ new_id:String) -> String {
    var myID: String = new_id

    //1차
    myID = myID.lowercased()

    //2차
    var newID: String = ""
    for i in myID {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "." {
            newID.append(i)
        }
    }

    //3차
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }

    //4차
    while newID.hasPrefix(".") {
        newID.removeFirst()
    }

    while newID.hasSuffix(".") {
        newID.removeLast()
    }

    //5차
    if newID == "" {
        newID = "a"
    }

    //6차
    if newID.count >= 16 {
        let index = newID.index(newID.startIndex, offsetBy: 15)
        newID = String(newID[newID.startIndex..<index])
        if newID.hasSuffix(".") {
            newID.removeLast()
        }
    }

    //7차
    if newID.count <= 2 {
        while newID.count != 3 {
            newID = newID + String(newID.last!)
        }
    }

    return newID
}







measureTime {
    solution("...!@BaT#*..y.abcdefghijklm")
}



solution("z-+.^.")

solution("=.=")
solution("123_.def")
solution("abcdefghijklmn.p")
solution("")


