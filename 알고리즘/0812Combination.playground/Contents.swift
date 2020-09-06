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

comb(arr: choice, index: 0, n: 5, r: 3, target: 0)
print(resultContainerArray)
