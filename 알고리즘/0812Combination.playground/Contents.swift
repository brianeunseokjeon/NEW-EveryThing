import UIKit

var aaa = [11,12,13,14,15]
var resultContainerArray:[[Int]] = []
var choice:[Int] = .init(repeating: 10, count: 3)

var count = 0
func comb(arr:[Int],index:Int ,n:Int, r:Int,target:Int) {
    var array = arr
    if r == 0 {
        resultContainerArray.append(array)
        print("종료 :",arr)
    } else if target == n {
        return
    } else {
        array[index] = aaa[target]
        comb(arr: array, index: index+1, n: n, r: r-1, target: target+1)
        comb(arr: array, index: index, n: n, r: r, target: target+1)
    }
}

//comb(arr: choice, index: 0, n: 5, r: 3, target: 0)
//print(resultContainerArray)

func combination(n:Int,r:Int) -> [[Int]] {
    var result: [[Int]] = []
    var array = Array<Int>.init(repeating: 0, count: r)
    
    func comb(arr:[Int],index:Int ,n:Int, r:Int,target:Int) {
        var array = arr
        if r == 0 {
            result.append(array)
        } else if target == n {
            return
        } else {
            array[index] = aaa[target]
            comb(arr: array, index: index+1, n: n, r: r-1, target: target+1)
            comb(arr: array, index: index, n: n, r: r, target: target+1)
        }
    }
    comb(arr: array, index: 0, n: n, r: r, target: 0)
    return result
}



print(combination(n: 5, r: 3))

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    var leftBoundMin: Int
    var leftBoundMax: Int
    var rightBoundMin: Int
    var rightBoundMax: Int
    
    public init(value: Element,leftBoundMin:Int,leftBoundMax:Int,rightBoundMin:Int,rightBoundMax:Int) {
        self.value = value
        self.leftBoundMin = leftBoundMin
        self.leftBoundMax = leftBoundMax
        self.rightBoundMin = rightBoundMin
        self.rightBoundMax = rightBoundMax
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}


class Combi {
    
}
