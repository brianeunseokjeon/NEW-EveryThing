import UIKit


/*


 
![DFS](dfs.png)


*/



func dfs(number:Int,sumArray:[Int]) -> [Int] {
    var solution = [Int]()
    for sumValue in sumArray {
        solution.append(number + sumValue)
    }
    for sumValue in sumArray {
        solution.append(-number + sumValue)
    }
    
    return solution
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var queue = numbers
    var solution = [0]
    
    while !queue.isEmpty {
       let number = queue.remove(at: 0)
       solution = dfs(number: number, sumArray: solution)
    }
    

    return solution.filter { $0 == target }.count
}

solution([1,1,1,1,1], 3)


//멋진 풀이가져옴 -> 이중 트리.......?
func dfs3(_ numbers:[Int], _ index:Int, _ target:Int, _ sum:Int) -> Int {
    if index == numbers.count {
        return sum == target ? 1 : 0
    } else {
        return dfs3(numbers, index+1, target, sum + numbers[index]) + dfs3(numbers, index+1, target, sum - numbers[index])
    }
}

func solution3(_ numbers:[Int], _ target:Int) -> Int {
    return dfs3(numbers, 0, target, 0)
}

