//
//  UICustomView.swift
//  ProtocolAbout
//
//  Created by brian은석 on 2021/02/01.
//

import UIKit


class UICustomView: UIView {
    
    weak var delegate:PresenterHelper?
    private let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
     
    }
    
//    convenience init(delegate:PresenterHelper) {
//        self.init(frame:CGRect.zero)
//        
//    }
    
    private func makeUI() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(act), for: .touchUpInside)
    }
    @objc func act() {
        print(1)
        delegate?.helpPresent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
