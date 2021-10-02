//
//  ViewController.swift
//  PermissionProjectMerveStyle
//
//  Created by Cokomel on 28.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var photoCameraButtons : PhotoCameraButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonFunc()
    }
    
    private func addButtonFunc () {
        
        photoCameraButtons = PhotoCameraButtons()
        photoCameraButtons.delegate = self
        photoCameraButtons.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoCameraButtons)
        NSLayoutConstraint.activate([
            photoCameraButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoCameraButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
}

extension MainViewController: HomeViewDelegate{
    func cameraPhotoButtonSelected(sender: UIButton) {
        let permissionView = PermissionViewController()
        permissionView.buttonType = (sender.titleLabel?.text)!
        permissionView.view.backgroundColor = UIColor.clear
        self.present(permissionView, animated: true)
    }
}

