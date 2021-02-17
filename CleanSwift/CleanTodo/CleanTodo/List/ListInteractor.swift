//
//  ListInteractor.swift
//  CleanTodo
//
//  Created by brian은석 on 2021/01/16.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListBusinessLogic {
    func fetchToDos(request: List.FetchToDos.Request)
    func updateCheck(index:Int)
}

protocol ListDataStore {
    var toDoList: [ToDo]? { get }
}

class ListInteractor: ListBusinessLogic, ListDataStore {
    var presenter: ListPresentationLogic?
    var toDoWorker = ListWorker(toDoStore: ToDoMemoryStore())
    
    var toDoList: [ToDo]?
    // MARK: Do something
    func updateCheck(index:Int) {
        let response = toDoWorker.updateCheckData(index: index)
        toDoList = response.list
        presenter?.presentFetchToDos(response: response)
    }
    
    func fetchToDos(request: List.FetchToDos.Request) {
        toDoWorker.fetchToDos { [weak self](todoList, error) in
            self?.toDoList = todoList
            let response = List.FetchToDos.Response(list: todoList)
            self?.presenter?.presentFetchToDos(response: response)
        }
    }
}