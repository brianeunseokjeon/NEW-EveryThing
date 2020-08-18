import UIKit


//블로그에 있는 함수
func permutation22222(_ arr : [Int],_ output : [Int],_ visited: [Bool],_ depth : Int,_ n : Int,_ r : Int){
    var output = output
    var visited = visited
    if depth == r {
        print(output)
        return
    }
    for i in (0..<n) {
        if visited[i] != true {
            visited[i] = true
            output[depth] = arr[i]
            permutation22222(arr,output,visited,depth + 1,n,r)
            output[depth] = 0
            visited[i] = false
        }
    }
}

//내가 만든 함수 visited를 지워보았다.
func permutation(_ arr : [Int],_ output : [Int],_ depth : Int,_ n : Int,_ r : Int){
    var output = output
    var array = arr
    if depth == r {
        print(output)
        return
    }
    for i in (0..<n) {
        output[depth] = arr[i]
        array.remove(at: i)
        permutation(array, output, depth+1, n-1, r)
        array.insert(arr[i], at: i)
    }
}
var answer = 0
let arr = [1,2,3,4]
let n = arr.count
let r = 2
let output : [Int] = Array(repeating: 0, count: r)
//let visited : [Bool] = Array(repeating: false, count: n)
permutation(arr,output,0,n,r)

//permutation2(arr,output,visited,0,n,r)
