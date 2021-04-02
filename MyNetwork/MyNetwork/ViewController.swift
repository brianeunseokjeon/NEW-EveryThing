//
//  ViewController.swift
//  MyNetwork
//
//  Created by 맥북프로에임메드 on 2021/03/04.
//

import UIKit
import RxCocoa
import RxSwift

struct Version: Codable {
    let version: String?
    let description: String?
    let force: Bool?
    let message: String?
}
struct Exitst: Codable {
    let exist: Bool?
}

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let param = ["os":"ios"]
        let body = ["value":""]
        let a = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let buttonOb = button.rx.tap.asObservable()
        let networkOb:Observable<Result<Version,NetworkError>> = NetworkService.request(request: .get, url: "",param: param)
        
        buttonOb.flatMap{ tap -> Observable<Result<Version,NetworkError>> in
            return networkOb
        }.subscribe(onNext:{ dataResult in
            switch dataResult {
            case .success(let data):
                print("값이 왔당",data)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }).disposed(by: disposeBag)


    }

    
    
    
    
    
    
    
    
    
    @IBAction func act(_ sender: Any) {
        
        
//        NetworkService.uploadImage(urlString: "", paramName: "file", fileName: "file.jpg", image: UIImage(named: "myImage")!, token: "")
    }
    
}

