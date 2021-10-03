//
//  PermissionViewProtocol.swift
//  PermissionProjectMerveStyle2
//
//  Created by Cokomel on 3.10.2021.
//

import UIKit
//Protocol and functions are created for permission view.
protocol PermissionViewProtocol{
    func permissionButtonClicked(sender: UIButton, type: String)
    func noPermissionButtonClicked(sender: UIButton)
}
