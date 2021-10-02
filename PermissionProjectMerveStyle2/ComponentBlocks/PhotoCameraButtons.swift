//
//  ActionButton.swift
//  PermissionProjectMerveStyle
//
//  Created by Cokomel on 28.09.2021.
//

import UIKit

protocol HomeViewDelegate{
    func cameraPhotoButtonSelected(sender: UIButton)
}

class PhotoCameraButtons : UIView {
    
    var delegate: HomeViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let stackView = makeStackView(withOrientation: .vertical)
        let cameraButton = makeButton(with: "Camera", fontAndSize: FontManager.bold(20).value, type: .filled, colour: UIColor.darkRed)
        let photosButton = makeButton(with: "Photos", fontAndSize: FontManager.bold(20).value,type: .filled, colour: UIColor.darkYellow)
        
        stackView.addArrangedSubview(cameraButton)
        stackView.addArrangedSubview(photosButton)
        self.addSubview(stackView)
        cameraButton.addTarget(self, action: #selector(cameraPhotoSelected), for: .touchUpInside)
        photosButton.addTarget(self, action: #selector(cameraPhotoSelected), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
    }
    
    
    @objc func cameraPhotoSelected(sender: UIButton) {
        if let delegate = delegate {
            delegate.cameraPhotoButtonSelected(sender: sender)
        }
    }
    
}


