//
//  BasicTableViewCell.swift
//  DaumComicToon
//
//  Created by Brian on 22/04/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell ,UIScrollViewDelegate{

    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var secondScrollView: UIScrollView!
    @IBOutlet weak var bottomScrollView: UIScrollView!
    
    @IBOutlet weak var contentView1: UIView!
    @IBOutlet weak var contentView2: UIView!
    @IBOutlet weak var contentView3: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var firstLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var secondLabelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var thirdTrailing: NSLayoutConstraint!
    
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    var myTag = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        topScrollView.delegate = self
        secondScrollView.delegate = self
        bottomScrollView.delegate = self
        
        topScrollView.scrollToBottom()
        secondScrollView.scrollToBottom()
        bottomScrollView.scrollToBottom()

    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        <#code#>
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == topScrollView && firstLabelWidth.constant != 65 {
            UIView.animate(withDuration: 0.5) {
                    self.firstLabelWidth.constant -= 15
                    self.contentView1.layoutIfNeeded()
            }
//            print(scrollView.contentOffset.y)
        } else if scrollView == secondScrollView && secondLabelWidth.constant != 65 {
            UIView.animate(withDuration: 0.5) {
                    self.secondLabelWidth.constant -= 15
                self.contentView2.layoutIfNeeded()
            }
        } else if scrollView == bottomScrollView && thirdTrailing.constant != -55 {
            UIView.animate(withDuration: 2) {
                self.thirdTrailing.constant += 15

            self.contentView3.layoutIfNeeded()
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
       
        topScrollView.scrollToBottom()
        secondScrollView.scrollToBottom()
        bottomScrollView.scrollToBottom()
        
        firstLabelWidth.constant = 80
        secondLabelWidth.constant = 80
        thirdTrailing.constant = -70

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



