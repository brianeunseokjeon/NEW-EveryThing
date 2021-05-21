//
//  RxViewController.swift
//  AnimationOfT
//
//  Created by brian on 2021/05/21.
//

import UIKit
import ReactorKit
import RxCocoa
import RxGesture

class RxTwitterViewController: UIViewController ,View {
    var disposeBag: DisposeBag = DisposeBag()
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "tile00")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        reactor = TwitterReactor()
    }
    
    func bind(reactor: TwitterReactor) {

        
        imageView.rx.tapGesture()
            .map{ _ in Reactor.Action.imageButtonTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.animateInfo }
            .subscribe { [weak self](images,repeatCount,start) in
                self?.imageView.animationImages = images
                self?.imageView.animationRepeatCount = repeatCount
                self?.imageView.animationDuration = 0.6
                self?.imageView.startAnimating()
            }.disposed(by: disposeBag)
            
            
//            .bind(to: (imageView.rx.animationImages,imageView.rx.animationRepeatCount,imageView.startAnimating()))
//            .disposed(by: disposeBag)
            
    }
    
}

extension RxTwitterViewController {
    func makeUI() {
        view.addSubview(imageView)
//        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

}
