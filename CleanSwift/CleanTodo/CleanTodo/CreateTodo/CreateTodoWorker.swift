//
//  CreateTodoWorker.swift
//  CleanTodo
//
//  Created by brian은석 on 2021/01/18.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class CreateTodoWorker {
    let toDoStore: ToDoStore
    init(toDoStore: ToDoStore){
        self.toDoStore = toDoStore
    }

    func createToDo(todoCreate: ToDo, completionHandler: @escaping (ToDo?, ToDoStoreError?) -> Void){
        toDoStore.createToDo(todoCreate: todoCreate) { (todo, error) in
            DispatchQueue.main.async {
                completionHandler(todo, error)
            }
        }
    }
}
