import UIKit


//Queue - 프로그래머스 다리건너는 트럭문제
struct Truck {
    var myTime = 0
    var myWeight:Int
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks:[Int] = truck_weights
    var queue:[Truck] = []
    var totalWeight = 0
    var time = 0
    while !trucks.isEmpty || !queue.isEmpty {
        time += 1
        if !queue.isEmpty && time - queue[0].myTime == bridge_length {
           let arrivedTruck = queue.remove(at: 0)
            totalWeight -= arrivedTruck.myWeight
            if queue.isEmpty && trucks.isEmpty {
//                print("여기 들어오면 끝인데? ",time)
                return time
            }
        }
        guard !trucks.isEmpty && (totalWeight + trucks[0]) <= weight else { continue }
        let truckWeight = trucks.remove(at: 0)
        queue.append(Truck.init(myTime: time, myWeight: truckWeight))
//        print("--------------------------------------------")
//        for x in queue {
//            print("truck weight :",x.myWeight, "time :",x.myTime)
//        }
        totalWeight += truckWeight
    }
    return time
}


//solution(2, 10, [7,4,5,6])
solution(100, 100, [10])
solution(100,100, [10,10,10,10,10,10,10,10,10,10])


