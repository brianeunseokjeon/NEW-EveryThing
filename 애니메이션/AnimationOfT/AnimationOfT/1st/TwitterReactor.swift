//
//  TwitterReactor.swift
//  AnimationOfT
//
//  Created by brian on 2021/05/21.
//

import Foundation
import ReactorKit

class TwitterReactor: Reactor {
    private let spriteImages: [UIImage] = {
        var images:[UIImage] = []
        for i in 0..<29 {
            images.append(UIImage(named: "tile0\(i)")!)
        }
        return images
    }()
    
    enum Action {
        case imageButtonTap
    }
    
    enum Mutation {
        case setAnimating(Bool)
        case senderImage([UIImage])
    }
    
    struct State {
        var isAnimating: Bool = false
        var animateInfo:(images:[UIImage],repeatCount:Int,isStart:Void)?
    }
    
    let initialState = State()
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .imageButtonTap:
            guard currentState.isAnimating == false else { return Observable.empty() }
            return Observable.concat([
                Observable.just(Mutation.setAnimating(true)),
                Observable.just(Mutation.senderImage(spriteImages)),
                Observable.just(Mutation.setAnimating(false)).delay(.milliseconds(600), scheduler: MainScheduler.instance)
            ])
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .senderImage(let images):
            state.animateInfo = (images,1,())
        case .setAnimating(let isAnimation):
            state.isAnimating = isAnimation
        }
        return state
    }
    
    
    
}
