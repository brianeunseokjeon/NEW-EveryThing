//
//  Todo.swift
//  CleanTodo
//
//  Created by brian은석 on 2021/01/18.
//

import Foundation
struct ToDo {
    var id: String?
    var isChecked: Bool
    var title: String
    var when: When
    var location: Location

    enum When {
        case everyDay
        case once
        case twice
        case Third
    }
    enum Location{
        case home
        case outSide
        case academy
    }
}
