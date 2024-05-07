//
//  BlurView.swift
//  CoffeeCafeShop
//
//  Created by Ice on 18/4/2567 BE.
//

import UIKit
import SwiftUI
import Foundation

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .light
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
