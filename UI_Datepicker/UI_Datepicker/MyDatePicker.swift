//
//  MyDatePicker.swift
//  UI_Datepicker
//
//  Created by 맥북프로에임메드 on 2020/10/29.
//

import UIKit

class MyDatePicker: UIView {
    let hiddenButton = UIButton()
    let containView = UIView()
    let okButtonContainView = UIView()
    let okButton = UIButton()
    let horizontalView = UIView()
    let datePickerContainer = UIView()
    let datePicker = UIDatePicker()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private func makeUI() {
        self.backgroundColor = .clear
        
        self.addSubview(containView)
        containView.translatesAutoresizingMaskIntoConstraints = false
        containView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        containView.backgroundColor = .white
        
        containView.addSubview(okButtonContainView)
        okButtonContainView.translatesAutoresizingMaskIntoConstraints = false
        okButtonContainView.topAnchor.constraint(equalTo: containView.topAnchor).isActive = true
        okButtonContainView.leadingAnchor.constraint(equalTo: containView.leadingAnchor).isActive = true
        okButtonContainView.trailingAnchor.constraint(equalTo: containView.trailingAnchor).isActive = true
        okButtonContainView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        okButtonContainView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        containView.addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.topAnchor.constraint(equalTo: okButtonContainView.topAnchor).isActive = true
        okButton.trailingAnchor.constraint(equalTo: okButtonContainView.trailingAnchor).isActive = true
        okButton.bottomAnchor.constraint(equalTo: okButtonContainView.bottomAnchor).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        okButton.setTitle("확인", for: .normal)
        okButton.addTarget(self, action: #selector(okAction), for: .touchUpInside)
        
        self.addSubview(hiddenButton)
        hiddenButton.translatesAutoresizingMaskIntoConstraints = false
        hiddenButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        hiddenButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        hiddenButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        hiddenButton.bottomAnchor.constraint(equalTo: containView.topAnchor).isActive = true
        hiddenButton.addTarget(self, action: #selector(okAction), for: .touchUpInside)
        hiddenButton.backgroundColor = .clear
        
        
        containView.addSubview(horizontalView)
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        horizontalView.topAnchor.constraint(equalTo: okButtonContainView.bottomAnchor).isActive = true
        horizontalView.trailingAnchor.constraint(equalTo: okButtonContainView.trailingAnchor).isActive = true
        horizontalView.leadingAnchor.constraint(equalTo: okButtonContainView.leadingAnchor).isActive = true
        
        horizontalView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalView.backgroundColor = .darkGray
        
        
        
        containView.addSubview(datePickerContainer)
        datePickerContainer.translatesAutoresizingMaskIntoConstraints = false
        datePickerContainer.topAnchor.constraint(equalTo: horizontalView.bottomAnchor).isActive = true
        datePickerContainer.trailingAnchor.constraint(equalTo: containView.trailingAnchor).isActive = true
        datePickerContainer.leadingAnchor.constraint(equalTo: containView.leadingAnchor).isActive = true
        datePickerContainer.bottomAnchor.constraint(equalTo: containView.bottomAnchor).isActive = true
        
        datePickerContainer.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: datePickerContainer.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: datePickerContainer.centerYAnchor).isActive = true

        datePicker.minimumDate = dateFormatter.date(from: "2020-01-01")
        datePicker.maximumDate = Date()
        
        //데이터피커 색깔
        datePicker.setValue(UIColor.black, forKeyPath: "textColor")
        //데이터 피커 한국어
        datePicker.locale = Locale(identifier: "ko_KO")
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    @objc
    func okAction() {
        print("??",datePicker.date)

        self.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
