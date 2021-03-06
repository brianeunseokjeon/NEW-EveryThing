import UIKit

let df: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd"
    return df
}()
let today = Date()

func lastDayOfMonth() -> Date {
    let calendar = Calendar.current
    let components = DateComponents(day:1)
    let startOfNextMonth = calendar.nextDate(after:Date(), matching: components, matchingPolicy: .nextTime)!
    let lastDate = calendar.date(byAdding:.day, value: -1, to: startOfNextMonth)!
    let stringDate = df.string(from: lastDate)
    
    return df.date(from: stringDate)!
}

func dDay(startDate:Date) -> String {
    let stringDate = df.string(from: startDate)
    let startChangeDate = df.date(from: stringDate)!
    let dday = Int(lastDayOfMonth().timeIntervalSince(startChangeDate) / 3600 / 24)
    return "D-\(dday)"
}
dDay(startDate: today)


func getSingle(){
    
    let date = Date()
    let calendar = Calendar.current //켈린더 객체 생성
    let year = calendar.component(.year, from: date)    //년
    let month = calendar.component(.month, from: date)  //월
    let day = calendar.component(.day, from: date)      //일
    print(day)
}
