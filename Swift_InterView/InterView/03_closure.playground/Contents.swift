import UIKit

// 간단히 만들기
var animals = ["fish", "cat", "chicken", "dog"]
animals.sort { (one: String, two: String) -> Bool in
    return one < two
}

//animals.sort { (one, two) in return one < two }
//animals.sort { return $0 < $1 }
//animals.sort { $0 < $1 }
//Finally, since Swift knows that the elements of the array conform to Equatable, you can simply write:
animals.sort(by: <)

