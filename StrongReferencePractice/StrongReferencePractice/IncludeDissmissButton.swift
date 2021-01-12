//
//  IncludeDissmissButton.swift
//  StrongReferencePractice
//
//  Created by brian은석 on 2021/01/12.
//

import UIKit

class IncludeDissmissButton: UIView {
    weak var viewcontroller:UIViewController?
    
    let button = UIButton()
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        makeUI()
    }
    func makeUI() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor,constant: 100).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)

    }
    @objc func nextAction() {
        viewcontroller?.dismiss(animated: true, completion: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
