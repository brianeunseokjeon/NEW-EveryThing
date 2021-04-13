import UIKit
class Person {

    var name: String

    var age: Int

    var gender: String

    init(name: String, age: Int, gender: String) {

        self.name = name

        self.age = age

        self.gender = gender

    }
    init(first:String,name: String, age: Int, gender: String) {
        self.name = first + name

        self.age = age

        self.gender = gender
    }

    convenience init(age: Int, gender: String) {
        self.init(name: "zedd", age: age, gender: gender)
        self.init(first:"",name:"",age:111,gender:gender)
        self.init(name: "zedd", age: age, gender: gender)


    }

}

Person(age: 10, gender: "Gggg").age



//조합
func comb(initArr:[Int],arr:[Int],index:Int ,n:Int, r:Int,target:Int) {
    var array = arr
    if r == 0 {
        resultContainerArray.append(array)

    } else if target == n {
        return
    } else {
        array[index] = initArr[target]
        comb(initArr: initArr, arr: array, index: index+1, n: n, r: r-1, target: target+1)
        comb(initArr: initArr, arr: array, index: index, n: n, r: r, target: target+1)
    }

}

var resultContainerArray:[[Int]] = []


// 스트링으로 합쳐서 유니크한지 확인해는군
func isUnique(input:[[String]]) -> [[Int]] {
    var uniqueArray = [[Int]]()
    for arr in resultContainerArray {
        var tempSet:Set<String> = []
        var isOkay = true
        for i in input {
            var temp = ""
            for x in arr {
               temp += i[x]
            }
            if tempSet.contains(temp) {
                isOkay = false
                break
            } else {
               tempSet.insert(temp)
            }
        }
        if isOkay {
            uniqueArray.append(arr)
        }
    }
    return uniqueArray
}


func solution(_ relation:[[String]]) -> Int {
    let initArr = [Int](0..<relation[0].count)

    for i in 1...initArr.count {
        let cho = Array<Int>.init(repeating: 0, count: i)
        comb(initArr: initArr, arr: cho, index: 0, n: initArr.count, r: i, target: 0)
    }


    var result = [Set<Int>]()
    let uniqueArray = isUnique(input: relation)
//    print(uniqueArray)
    
    // 마지막엔 최소성만족하는지 확인 부분집합 있으면 제외!!
    for x in uniqueArray {
        let setTemp = Set(x)
        var isOkay = true
        for y in result {
            if y.isSubset(of: setTemp) {
                isOkay = false
                break
            }
        }
        if isOkay {
            result.append(setTemp)
        }
    }
    return result.count
}
solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])

//print(resultContainerArray)
