//
//  ListRouter.swift
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

protocol ListRoutingLogic {
    func routeTo(destination: ListRouter.RouterDestination)
}

protocol ListDataPassing {
    var dataStore: ListDataStore? { get }
}

class ListRouter: ListRoutingLogic, ListDataPassing
{
    weak var viewController: ListViewController?
    var dataStore: ListDataStore?
    
    // MARK: Routing
    
    func routeTo(destination: ListRouter.RouterDestination) {
        switch destination {
        case .Create:
            let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "CreateTodoViewController") as! CreateTodoViewController
            destinationVC.navigationItem.title = "Create"
            
            navigateToCreateToDo(source: viewController!, destination: destinationVC)
        case .Show:
            print("show")
        }
    }
    
    // MARK: Navigation
    
    func navigateToCreateToDo(source: ListViewController, destination: CreateTodoViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToCreateOrder(source: ListDataStore, destination: inout CreateTodoDataStore){
        
    }
    
    
    // MARK: - RouterEnum
    enum RouterDestination {
        case Create
        case Show
    }
}