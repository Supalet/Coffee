//
//  AlertHelper.swift
//  CoffeeCafeShop
//
//  Created by Ice on 18/4/2567 BE.
//

import SwiftUI

extension View {
    func alertSystem(isPresented: Binding<Bool>, title: String, description: String) -> some View {
        self.alert(isPresented: isPresented, content: {
            Alert(title: Text(title),
                  message: Text(description))
        })
    }
    
    func showCustomAler(detail: Binding<customAlertModel>, isShow: Binding<Bool>) -> some View {
        modifier(CustomAlert(detail: detail, isShow: isShow))
    }
}
