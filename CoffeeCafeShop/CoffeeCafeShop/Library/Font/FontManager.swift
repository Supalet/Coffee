//
//  FontManager.swift
//  CoffeeCafeShop
//
//  Created by Ice on 15/4/2567 BE.
//

import Foundation
import SwiftUI

enum FontType: String {
    case bold = "Kanit-Bold"
    case light = "Kanit-Light"
    case medium = "Kanit-Medium"
    case regular = "Kanit-Regular"
    case semiBold = "Kanit-SemiBold"
}

class FontManager {
    static let sheard = FontManager()
    
    func getCustomFont(type: FontType, size: CGFloat) -> Font {
        return Font(UIFont(name: type.rawValue, size: size)!)
    }
}
