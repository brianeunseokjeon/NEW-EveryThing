//
//  MyStackButtonsViewmodel.swift
//  UIStackButton
//
//  Created by brian은석 on 2021/04/12.
//

import Foundation
import UIKit.UIKitCore

struct MyStackButtonsModel {
    let spacingValue: CGFloat = 8
    let counter = (rowCount:3,columnCount:4)

    func realTextSize(font: UIFont, text: String, extra: CGSize) -> CGSize {
        var size = textSize(font: font, text: text)
        size.width = size.width + extra.width
        size.height = size.height + extra.height
        return size
    }
    
    private func textSize(font: UIFont, text: String, width: CGFloat = .greatestFiniteMagnitude, height: CGFloat = .greatestFiniteMagnitude) -> CGSize {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.numberOfLines = 0
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.size
        
    }
}
