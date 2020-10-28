//
//  Util.swift
//  AxaProject
//
//  Created by brian on 27/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit

class Util {
    static let sapphireBlue: UIColor = #colorLiteral(red: 0.1294117647, green: 0.3137254902, blue: 0.6588235294, alpha: 1)
    
    static let whiteThree: UIColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    static let whiteFour: UIColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    static let warmGreyTwo: UIColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
    
    static let blackTwo: UIColor = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    static let brownishGrey: UIColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)

    
    
    static let deviceWidth: CGFloat = UIScreen.main.bounds.width
    static let deviceHeight: CGFloat = UIScreen.main.bounds.height
    
    static func ratio(_ size:CGFloat) -> CGFloat {
        return size/414 * deviceWidth
    }
}


