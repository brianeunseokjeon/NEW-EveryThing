import UIKit

var str = "Hello, playground"



struct Applicant {
    enum Language: String {
        case java,python,cpp
    }
    enum Job: String {
        case backend,frontend
    }
    enum Career: String{
        case junior,senior
    }
    enum Food: String{
        case chicken,pizza
    }
    
    let language: Language
    let job: Job
    let career: Career
    let food: Food
    let point: Int
    
    //    func meetTheConditions(strArray:[String]) -> Bool {
    //        if strArray[0] != "-" && strArray[0] != language.rawValue {
    //            return false
    //        } else if strArray[1] != "-" && strArray[1] != job.rawValue {
    //            return false
    //        } else if strArray[2] != "-" && strArray[2] != career.rawValue {
    //            return false
    //        } else if strArray[3] != "-" && strArray[3] != food.rawValue {
    //            return false
    //        } else if strArray[4] != "-" && strArray[4] != job.rawValue {
    //            return false
    //        }
    //
    //    }
    
    
}



//"abcd edererwer".contains("abcd")
let a = "java and backend and junior and pizza 100".split(separator: " ").filter{$0 != "and"}

let b = "- and - and - and - 150".split(separator: " ").filter{$0 != "and"}



//func solution(_ info:[String], _ query:[String]) -> [Int] {
//
//    func meetTheConditions(applicantArray:[[String]],queryArray:[String]) -> Int {
//        var count = 0
//        for applicant in applicantArray {
////            print(applicant,queryArray)
//            if queryArray[0] != "-" && queryArray[0] != applicant[0] {
//                continue
//            }
//            if queryArray[1] != "-" && queryArray[1] != applicant[1] {
//                continue
//            }
//            if queryArray[2] != "-" && queryArray[2] != applicant[2] {
//                continue
//            }
//            if queryArray[3] != "-" && queryArray[3] != applicant[3] {
//                continue
//            }
//
//            if queryArray[4] != "-" && Int(queryArray[4])! > Int(applicant[4])! {
//                continue
//            }
//
//            count += 1
////            print(queryArray[4]applicant[4],count)
//        }
//        return count
//    }
//
//    let applicants:[[String]] = info.map{$0.components(separatedBy: " ")}
//    let queryArray = query.map{$0.components(separatedBy: " ").filter{$0 != "and"}}
//    var result = [Int]()
//
//
//    for condition in queryArray {
//       let value = meetTheConditions(applicantArray: applicants, queryArray: condition)
//        result.append(value)
//    }
//    return result
//}





func solution(_ info:[String], _ query:[String]) -> [Int] {
    let language = ["cpp", "java", "python", "-"]
    let position = ["backend", "frontend", "-"]
    let career = ["junior", "senior", "-"]
    let food = ["chicken", "pizza", "-"]
    
    var table = [String:[Int]]()
    var result = [Int]()
    for lang in language {
        for posi in position{
            for ca in career{
                for fo in food{
                    let str = lang + posi + ca + fo
                    table.updateValue([], forKey: str)
                }
            }
        }
    }
    
    for candidate in info {
        let candiString = candidate.split(separator: " ")
        let l = ["\(candiString[0])","-"]
        let p = ["\(candiString[1])","-"]
        let c = ["\(candiString[2])","-"]
        let f = ["\(candiString[3])","-"]
        
        for lang in l {
            for posi in p{
                for ca in c{
                    for fo in f{
                        let key = lang + posi + ca + fo
                        table[key]?.append(Int(candiString[4])!)
                        
                    }
                }
            }
        }
    }
    
    // [String:[Int]] value가 array 일 경우 정렬이렇게 하면됨.
    for key in table.keys {
        table[key] = table[key]!.sorted()
    }

    
    for condition in query {
        let conditionArray = condition.replacingOccurrences(of: " and ", with: "").split(separator: " ")
        let key1 = String(conditionArray[0])
        let score = Int(conditionArray[1])!
        var lt = 0
        var rt = table[key1]!.count - 1
        
        //이중정렬
        while lt <= rt {
            let mid = (lt+rt)/2
            if table[key1]![mid] >= score {
                rt = mid - 1
            } else {
                lt = mid + 1
            }
        }
        
        result.append(table[key1]!.count - lt)
        
        
        
    }
    return result
}


solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])



//let aa = "java and backend and junior and pizza 100".replacingOccurrences(of: " and ", with: "").split(separator: " ")
//String(aa[0])
//Int(aa[1])
