//
//  MyStackButtons.swift
//  UIStackButton
//
//  Created by brian은석 on 2021/04/12.
//

import UIKit

class MyStackButtons: UIStackView {
    
    let model: MyStackButtonsModel = MyStackButtonsModel()
    
    private var buttonsArray: Array<[UIButton]> = Array.init(repeating: [], count: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI(spacing: model.spacingValue, row: model.counter.rowCount, column: model.counter.columnCount)

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func inputText(text:[String]) {
        
        let selfPadding:CGFloat = 60
        let width = UIScreen.main.bounds.size.width - selfPadding
        var currentPointX:CGFloat = 0
        var btnIndex = (row:0,column:-1)
        for title in text {
        let textSize = model.realTextSize(font: .systemFont(ofSize: 12), text: title, extra: CGSize(width: 20, height: 10))
            
            if currentPointX + textSize.width <= width && btnIndex.column != (model.counter.columnCount - 1) {
                btnIndex.column += 1
                currentPointX += textSize.width
                currentPointX += model.spacingValue
                
            } else {
                btnIndex.row += 1
                btnIndex.column = 0
                currentPointX = textSize.width
                currentPointX += model.spacingValue
            }
            
            guard btnIndex.row < model.counter.rowCount else {return}
            buttonsArray[btnIndex.row][btnIndex.column].setTitle("#\(title)", for: .normal)
            buttonsArray[btnIndex.row][btnIndex.column].isHidden = false
        }
    }
    
    private func makeUI(spacing:CGFloat,row:Int,column:Int) {
        self.axis = .vertical
        self.spacing = spacing
        self.alignment = .leading
        for row in 0..<row {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = spacing
            self.addArrangedSubview(stackView)
            for column in 0..<column {
                let button = UIButton()
                button.setTitle("#\(column)", for: .normal)
                button.isHighlighted = false
                button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                button.layer.borderWidth = 1
                button.layer.borderColor = #colorLiteral(red: 0.8078092933, green: 0.8030081987, blue: 0.8115004301, alpha: 1).cgColor
                button.addTarget(self, action: #selector(click(button:)), for: .touchUpInside)
                stackView.addArrangedSubview(button)
                button.isHidden = true
                buttonsArray[row].append(button)
            }
        }
    }
    

    
    @objc func click(button:UIButton) {
        guard var title = button.titleLabel?.text else { return }
        title.removeFirst()
        
        
    }
    

    
}
