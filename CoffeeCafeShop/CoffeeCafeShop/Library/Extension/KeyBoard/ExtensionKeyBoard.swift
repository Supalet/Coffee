//
//  ExtensionKeyBoard.swift
//  CoffeeCafeShop
//
//  Created by Ice on 18/4/2567 BE.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
