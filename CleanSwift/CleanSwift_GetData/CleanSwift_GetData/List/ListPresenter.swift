//
//  ListPresenter.swift
//  CleanSwift_GetData
//
//  Created by brian은석 on 2021/02/02.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListPresentationLogic {
  func presentFetchInfo(response: List.FetchData.Response)
}

class ListPresenter: ListPresentationLogic {
  weak var viewController: ListDisplayLogic?
  
    
    //4번
  func presentFetchInfo(response: List.FetchData.Response) {
    var displayedInformations: [List.FetchData.ViewModel.DisplayedInformation] = []
    for data in response.list {
        let displayedInfo = List.FetchData.ViewModel.DisplayedInformation(name: data.name, age: data.age)
        displayedInformations.append(displayedInfo)
    }
    
    //5번
    let viewModel = List.FetchData.ViewModel(displayedList: displayedInformations)
    viewController?.displayFetchedList(viewModel: viewModel)
  }
}
