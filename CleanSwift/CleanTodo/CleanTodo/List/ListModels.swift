//
//  ListModels.swift
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


//리퀘스트 입력 -> 리스폰스가 출력 이 명확하기에 테스트 짜기 쉬워짐.
//TDD 팁 : Then 이나 When 을 우선적으로 작성하면 됨. 기본먼저 짜는게 중요한건 아님.

enum List {
    // MARK: Use cases
    enum FetchToDos {
        struct Request{
        }
        struct Response {
            var list: [ToDo]
        }
        struct ViewModel {
            struct DisplayedToDo {
                var title: String
                var isChecked: Bool
            }
            var displayedList: [DisplayedToDo]
        }
    }
}
