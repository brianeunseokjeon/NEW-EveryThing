//
//  Extension.swift
//  DaumComicToon
//
//  Created by Brian on 22/04/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit
extension UIScrollView {

  func scrollToBottom() {
    let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
    setContentOffset(bottomOffset, animated: false)
  }
}
