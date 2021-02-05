//
//  ViewController.swift
//  Swift_InterView
//
//  Created by brian은석 on 2021/02/02.
//

import UIKit
protocol PresenterHelper:class {
    func helper()
}
protocol structProtocol {
    var name:String {get set}
}

struct AA: structProtocol{
    var name = "김치"
    var jane = 1
    var ni = 123
}

class ViewController: UIViewController,PresenterHelper,MediaContainer {
    var containView: UIView = UIView()
    
    var content: Content? = Content(URLString: "abcd", note: "bbbb")
    
    var media: UIImageView = UIImageView()
    
    var note: UILabel = UILabel()
    
    func helper() {
        let vc = ViewController()
        vc.view.backgroundColor = .white
        self.present(vc, animated: true, completion: nil)
    }
    var a:structProtocol = AA()
    let v = UICustomView()
    let myCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containView)
        containView.translatesAutoresizingMaskIntoConstraints = false
        containView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100).isActive = true
        containView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -100).isActive = true
        containView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 100).isActive = true
        containView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -100).isActive = true
        containView.backgroundColor = .blue
//        v.delegate = self
        
        contentChanged()
        makeUI()
    }


    deinit {
        print("사라진다 ViewController")
    }
}


struct Content {
    var URLString:String
    var note:String
}
protocol MediaContainer: class {
    var containView: UIView {get set}
    var content: Content? { get set }
    var media: UIImageView { get }
    var note: UILabel { get set }

    func contentChanged()
    func makeUI()
}

extension MediaContainer {
    func contentChanged() {
        // Update view...
        media.image = UIImage(named: content!.URLString)
        note.text = content?.note
    }
    func makeUI() {
        containView.addSubview(media)
        media.translatesAutoresizingMaskIntoConstraints = false
        media.topAnchor.constraint(equalTo: containView.topAnchor).isActive = true
        media.leadingAnchor.constraint(equalTo: containView.leadingAnchor).isActive = true
        media.trailingAnchor.constraint(equalTo: containView.trailingAnchor).isActive = true
        media.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containView.addSubview(note)
        note.translatesAutoresizingMaskIntoConstraints = false
        note.topAnchor.constraint(equalTo: media.bottomAnchor).isActive = true
        note.leadingAnchor.constraint(equalTo: containView.leadingAnchor).isActive = true
        note.trailingAnchor.constraint(equalTo: containView.trailingAnchor).isActive = true
        note.bottomAnchor.constraint(equalTo: containView.bottomAnchor).isActive = true
        note.font = .systemFont(ofSize: 50, weight: .bold)
    }
}

// 프로토콜 선언만 하면 싱글톤에 접근되어있는상태임을 보여줌.와우!
protocol ContainContents {
    var contents: [Content] {get}
}
class TimelineContentObject {
    static let shared = TimelineContentObject()
    var contents: [Content] = [Content(URLString: "abcd", note: "bad"),Content(URLString: "vv", note: "123121231231231231231231231231231231231231231231231231231233123")]
}

extension ContainContents {
    var contents: [Content] {
        return TimelineContentObject.shared.contents
    }
}

