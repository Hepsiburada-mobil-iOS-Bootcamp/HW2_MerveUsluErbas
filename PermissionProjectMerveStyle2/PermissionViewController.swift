//
//  PermissionViewController.swift
//  PermissionProjectMerveStyle2
//
//  Created by Cokomel on 30.09.2021.
//


import UIKit
import Foundation
import PhotosUI
import Combine
import SwiftUI

class PermissionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var buttonType:String = ""
    var permissionViewContainer:PermissionViewContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    

    func setupView() {
        
        permissionViewContainer = PermissionViewContainer(type: buttonType)
        view.addSubview(permissionViewContainer)
        permissionViewContainer.delegate = self
        permissionViewContainer.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            permissionViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            permissionViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            permissionViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }

}

extension PermissionViewController: PermissionViewDelegate{
    func noPermissionButtonClicked(sender: UIButton) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
   
    
    func permissionButtonClicked(sender: UIButton, type : String) {
        
       
        switch type {
        case "Camera":
            AVCaptureDevice.requestAccess(for: .video) { granted in
                        print("CAMERA PERMISSION GRANTED : \(granted)")
                        if granted || !granted {
                            DispatchQueue.main.async {
                                self.dismiss(animated: true, completion: nil)
                            }
                  }
                    }
        
    case "Photos":
        PHPhotoLibrary.requestAuthorization { status in
            print("photo access status : \(status)")
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
        default:
            return
        
    }
   
}
}
