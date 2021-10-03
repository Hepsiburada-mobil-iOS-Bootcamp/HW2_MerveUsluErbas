//
//  BaseView.swift
//  PermissionProjectMerveStyle2
//
//  Created by Cokomel on 3.10.2021.
//

import UIKit

// BaseView is created for other UIView Class.
class BaseView :UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView () {
        
    }
}
