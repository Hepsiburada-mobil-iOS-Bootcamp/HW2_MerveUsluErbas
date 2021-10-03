//
//  ActionButton.swift
//  PermissionProjectMerveStyle
//
//  Created by Cokomel on 28.09.2021.
//

import UIKit


//The Container which holds the camera and photo button on main screen.
class PhotoCameraButtons : BaseView {
    
    var delegate: MainViewProtocol?
    
    override func setupView() {
        
        //Vertical stackview is created.
        let stackView = makeStackView(withOrientation: .vertical)
        //Camera and photos buttons are created.
        let cameraButton = makeButton(with: "Camera", fontAndSize: FontManager.bold(20).value, type: .filled, colour: UIColor.darkRed)
        let photosButton = makeButton(with: "Photos", fontAndSize: FontManager.bold(20).value,type: .filled, colour: UIColor.darkYellow)
        
        //Buttons are inserted into the stackview.
        stackView.addArrangedSubview(cameraButton)
        stackView.addArrangedSubview(photosButton)
        self.addSubview(stackView)
        //Buttons clicks are added.
        cameraButton.addTarget(self, action: #selector(cameraPhotoSelected), for: .touchUpInside)
        photosButton.addTarget(self, action: #selector(cameraPhotoSelected), for: .touchUpInside)
        
        //Stackview is inserted into the UIView.
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    //The function is called when Camera or Photos button is clicked.
    @objc func cameraPhotoSelected(sender: UIButton) {
        if let delegate = delegate {
            delegate.cameraPhotoButtonSelected(sender: sender)
        }
    }
    
}


