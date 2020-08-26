//
//  ViewController.swift
//  UI_Label_autoFontSizeAboutFrame
//
//  Created by 맥북프로에임메드 on 26/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit
//궁금한 점은
class ViewController: UIViewController {
    
    let semiView = UIView()
    let label = UILabel()
    //이렇게 되면 넘치게됨 -> 이렇게 되면 semiview의 높이 priority 와 label bottom
    let overFont: (CGFloat,CGFloat) = (760,100)
    
    //이렇게 되면 안넘침..
    let not: (CGFloat,CGFloat) = (550,100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(semiView)
        semiView.translatesAutoresizingMaskIntoConstraints = false
        semiView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        semiView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        semiView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        let hei = semiView.heightAnchor.constraint(equalToConstant: overFont.0)
        hei.priority = .init(rawValue: 750)
//        semiView.heightAnchor.constraint(equalToConstant: overFont.0).isActive = true
        hei.isActive = true
        semiView.backgroundColor = .lightGray
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        // 탑 바텀.. 오토레이아웃이 안먹히는듯.. 자체적으로 우선순위에서 밀려나나보네?
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //이부분의 오토레이아웃이 안먹히는듯.. 자체적으로 우선순위에서 밀려나나보네?
        label.bottomAnchor.constraint(equalTo: semiView.topAnchor).isActive = true
        
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.font = UIFont.systemFont(ofSize: overFont.1, weight: .bold)
        label.text = "가나다"
        label.contentCompressionResistancePriority(for: .vertical)
        
    }
    /*
 hugging : 늘어나는것 금지
     compression : 줄어드는것 금지
 */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        label.resizeToFitHeight()
    }
    

}



extension UILabel {
    
    //Finds and sets a font size that matches the height of the frame.
    //Use in case the font size is epic huge and you need to resize it.
    func resizeToFitHeight(){
        var currentfontSize = font.pointSize
        let minFontsize = CGFloat(5)
        let constrainedSize = CGSize(width: frame.width, height: CGFloat(500))
        
        while (currentfontSize >= minFontsize){
            guard let text = text else { return }
            let newFont = font.withSize(currentfontSize)
            let attributedText: NSAttributedString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: newFont])
            let rect: CGRect = attributedText.boundingRect(with: constrainedSize, options: .usesLineFragmentOrigin, context: nil)
            let size: CGSize = rect.size
            print("사이즈 :", size.height,"프레임 사이즈:",frame.height,constrainedSize)
            if (size.height < frame.height - 4) {
                font = newFont
                break;
            }
            currentfontSize -= 1
        }
        
        //In case the text is too long, we still show something... ;)
        if (currentfontSize <= minFontsize){
            font = font.withSize(currentfontSize)
        }
    }
}
