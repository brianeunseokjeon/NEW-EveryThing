//
//  ViewController.swift
//  CounterMvvm1
//
//  Created by Brian on 10/06/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa



class ViewController: UIViewController ,StoryboardView {
    
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    var disposeBag = DisposeBag()

    func bind(reactor: CounterViewReactor) {
        increaseButton.rx.tap
            .map{Reactor.Action.increase}
            .bind(to: reactor.action)
            .disposed(by:disposeBag)
        
        decreaseButton.rx.tap
        .map { Reactor.Action.decrease }
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        reactor.state.map { $0.value }   // 10
            .distinctUntilChanged()
            .map { "\($0)" }               // "10"
            .bind(to: valueLabel.rx.text)  // Bind to valueLabel
            .disposed(by: disposeBag)

          reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }


}

