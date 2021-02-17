//
//  CreateTodoViewController.swift
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

protocol CreateTodoDisplayLogic: class
{
    func displayCreatedToDo(viewModel: CreateTodo.CreateToDo.ViewModel)
}

class CreateTodoViewController: UIViewController, CreateTodoDisplayLogic {
    var interactor: CreateTodoBusinessLogic?
    var router: (NSObjectProtocol & CreateTodoRoutingLogic & CreateTodoDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CreateTodoInteractor()
        let presenter = CreateTodoPresenter()
        let router = CreateTodoRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // MARK: Do something
    private lazy var saveButton:UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction))
        
        return button
    }()
    @objc func saveAction() {
        print("save")
    }
    
    private func makeUI() {
        self.navigationItem.rightBarButtonItem = saveButton
        
    }
    func doSomething() {
    }
    
    func displayCreatedToDo(viewModel: CreateTodo.CreateToDo.ViewModel) {
        
    }
}