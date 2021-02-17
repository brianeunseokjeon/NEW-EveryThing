//
//  ToDoStore.swift
//  CleanTodo
//
//  Created by brian은석 on 2021/01/18.
//

import Foundation

protocol ToDoStoreUtility {}
extension ToDoStoreUtility {
  func generateOrderID(todo: inout ToDo) {
    guard todo.id == nil else { return }
    todo.id = "\(arc4random())"
  }
}

protocol ToDoStore {
    func updateCheckToDo(index:Int) -> [ToDo]
    func fetchToDos(completionHandler: @escaping ([ToDo], ToDoStoreError?) -> Void)
    func createToDo(todoCreate: ToDo, completionHandler: @escaping (ToDo?, ToDoStoreError?) -> Void)
//    func updateToDo(todoUpdate: ToDo, completionHandler: @escaping (ToDo?, ToDoStoreError?) -> Void)
//    func deleteToDo(id: Int, completionHandler: @escaping (ToDo?, ToDoStoreError?) -> Void)
}



enum ToDoStoreError: Equatable, Error {
  case CannotFetch(String)
  case CannotCreate(String)
  case CannotUpdate(String)
  case CannotDelete(String)
}

func ==(lhs: ToDoStoreError, rhs: ToDoStoreError) -> Bool {
  switch (lhs, rhs) {
  case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
  case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
  case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
  case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
  default: return false
  }
}


enum ToDosStoreResult<U> {
  case Success(result: U)
  case Failure(error: ToDoStoreError)
}
