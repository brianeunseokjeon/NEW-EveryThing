import UIKit
/*
Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 
https://leetcode.com/problems/counting-bits/
 
Example 1:

Input: 2
Output: [0,1,1]
Example 2:

Input: 5
Output: [0,1,1,2,1,2]
 */
func countBits(_ num: Int) -> [Int] {
    var twoSquareNumber = 1
    var reCycleNumber = 1
    var result:[Int] = []
    for x in 0...num {
        if x == 0 {
            result.append(0)
        } else if x == 1 {
            result.append(1)
        } else {
            if x % twoSquareNumber == 0 {
                result.append(1)
                twoSquareNumber *= 2
                reCycleNumber = 1
            } else {
                result.append(1 + result[reCycleNumber])
                reCycleNumber += 1
                
            }
        }
        
    }
    
    return result
}
countBits(5)

//이런 함수도 있음..
let a1 = (0...4).map{$0.nonzeroBitCount}
