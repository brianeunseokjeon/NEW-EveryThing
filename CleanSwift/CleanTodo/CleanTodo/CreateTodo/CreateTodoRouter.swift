//
//  CreateTodoRouter.swift
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

@objc protocol CreateTodoRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CreateTodoDataPassing
{
  var dataStore: CreateTodoDataStore? { get }
}

class CreateTodoRouter: NSObject, CreateTodoRoutingLogic, CreateTodoDataPassing
{
  weak var viewController: CreateTodoViewController?
  var dataStore: CreateTodoDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: CreateTodoViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: CreateTodoDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
