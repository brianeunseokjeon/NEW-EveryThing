//
//  ToDoMemoryStore.swift
//  CleanTodo
//
//  Created by brian은석 on 2021/01/19.
//

import Foundation

class ToDoMemoryStore: ToDoStore ,ToDoStoreUtility{
    static var toDos: [ToDo] = [
        ToDo(id: "0", isChecked: true, title: "5시간 공부", when: .everyDay, location: .home),
        ToDo(id: "1", isChecked: false, title: "1시30분에 잠들기", when: .everyDay, location: .home),
        ToDo(id: "2", isChecked: false, title: "하늘보기", when: .Third, location: .outSide)
    ]
    
    func updateCheckToDo(index: Int) -> [ToDo] {
        let updateCheck = !type(of: self).toDos[index].isChecked
        type(of: self).toDos[index].isChecked = updateCheck
        return type(of: self).toDos
    }
    
    func fetchToDos(completionHandler: @escaping ([ToDo], ToDoStoreError?) -> Void) {
        completionHandler(type(of: self).toDos,nil)
    }
    
    
    func createToDo(todoCreate: ToDo, completionHandler: @escaping (ToDo?, ToDoStoreError?) -> Void) {
        var todo = todoCreate
        generateOrderID(todo: &todo)
        type(of: self).toDos.append(todo)
        //여기서 유저디폴트하면 될듯
        completionHandler(todo,nil)
        
    }
    
    
}
