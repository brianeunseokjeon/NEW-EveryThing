//
//  ViewController.swift
//  BoundsTest
//
//  Created by Brian on 08/06/2020.
//  Copyright © 2020 Brian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var boundsView: UIView!
    @IBOutlet weak var ylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//바운스는 자신만의 좌표계를 따름.. 즉-> 여기선 boundsView안에 무한한 좌표계가 있음. 근데 보여지는건 저 파란색 크기만큼 보여짐. 그래서 bounds를 이동시키면 x 100, y 100 으로 할경우, 파란색뷰의 실제 위치는 변하지 않은체, 그안에 있는 좌표계만 이동하게 되는것. 이것은 스크롤뷰와 관련이 깊음!
    @IBAction func buttonAction(_ sender: Any) {
        boundsView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        print(boundsView.bounds,ylabel.bounds)
        
        
    }
}

