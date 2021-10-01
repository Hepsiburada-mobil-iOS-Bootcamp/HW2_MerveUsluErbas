//
//  FontManager.swift
//  PermissionProjectMerveStyle
//
//  Created by Cokomel on 29.09.2021.
//

import Foundation
import UIKit

enum FontManager {
    
    var value : UIFont {
        switch self {
        case .bold(let size):
            return UIFont.systemFont(ofSize: size, weight: .bold)
        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .light(let size):
            return UIFont.systemFont(ofSize: size, weight: .light)
        case .semibold(let size):
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        }
        
        
    }
    
    case bold(CGFloat)
    case regular(CGFloat)
    case light(CGFloat)
    case semibold(CGFloat)
}
