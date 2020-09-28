//
//  ViewController.swift
//  Camera
//
//  Created by 맥북프로에임메드 on 2020/09/28.
//  Copyright © 2020 brian. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVCapturePhotoCaptureDelegate {
    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
          return view
    }()
    
    let photo_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("사진찍기", for: .normal)
        btn.addTarget(self, action: #selector(didTakePhoto), for: .touchUpInside)
        return btn
    }()
    let photo_imageview : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
//        iv.backgroundColor = .brown
        return iv
        
    }()
    
    let button = UIButton()

    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
//    let imageName = UIImage(named: "icon_camera_wh")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuplayout()
        
    }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated)
        // 여기다가 frame 값을 넣은 이유는 viewdidload에서는 view1의 레이아웃이 다 지정되지 않았기 때문에 생명주기를 활용하여 viewdidload다음 순서에서 view1의 데이터를 받아온다.
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("Unable to access back camera!")
            return
            
        }
        do {
            let input = try AVCaptureDeviceInput(device: backCamera) //Step 9
            stillImageOutput = AVCapturePhotoOutput()
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
                
            }
            
        } catch let error {
            print("Error Unable to initialize back camera: \(error.localizedDescription)")
            
        }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession.startRunning() //Step 13
                DispatchQueue.main.async { // 여기서 view1 은 내가 카메라가 나올 uiView
                    self?.videoPreviewLayer.frame = (self?.view1.bounds)!
                    
            }
            
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?){
        guard let imageData = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: imageData) //여기서 photo_imageview 은 사진촬영후 나오는 이미지 뷰
        photo_imageview.image = image
        
    }
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait // 여기서 view1 은 내가 카메라가 나올 uiView
        view1.layer.addSublayer(videoPreviewLayer) //Step12
        
    }
    
    func setuplayout() {
        view.addSubview(view1)
        view1LayoutManager()
        view.addSubview(photo_btn)
        photoButtonManager()
        view.addSubview(photo_imageview)
        photoImageViewManager()
        
    }
    func view1LayoutManager() {
        view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        view1.heightAnchor.constraint(equalToConstant: view.frame.height * 0.8).isActive = true
        print("시볼 : \(view1.bounds.size.height)")
        
    }
    
    func photoButtonManager() {
        photo_btn.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10).isActive = true
        photo_btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        photo_btn.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        photo_btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
    }
    func photoImageViewManager() {
        photo_imageview.topAnchor.constraint(equalTo: view1.topAnchor).isActive = true
        photo_imageview.trailingAnchor.constraint(equalTo: view1.trailingAnchor).isActive = true
        photo_imageview.leadingAnchor.constraint(equalTo: view1.leadingAnchor).isActive = true
        photo_imageview.bottomAnchor.constraint(equalTo: view1.bottomAnchor).isActive = true
        
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view1.bottomAnchor,constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: photo_btn.trailingAnchor,constant: 10).isActive = true
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(act), for: .touchUpInside)
    }
    
    @objc func didTakePhoto() {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
        self.captureSession.stopRunning()

    }

    @objc func act() {
        photo_imageview.image = nil
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession.startRunning() //Step 13
                DispatchQueue.main.async { // 여기서 view1 은 내가 카메라가 나올 uiView
                    self?.videoPreviewLayer.frame = (self?.view1.bounds)!
                    
            }
            
        }
    }


}

