//
//  InputView.swift
//  CoffeeCafeShop
//
//  Created by Ice on 15/4/2567 BE.
//

import SwiftUI

enum InputViewState {
    case placeHolder
    case focus
    case value
    case fail
}

struct InputView: View {
    @State var state: InputViewState = .placeHolder
    @State var boarderColor: Color = Color.black
    @Binding var value: String
    
    var placeHolder: String = "email"
    var cornerRadius: CGFloat = 10
    var borderWidth: CGFloat = 1
    var defultTextColor: Color = Color.black
    var defultColor: Color = Color.black
    var focusColor: Color = Color.red
    var valueColor: Color = Color.black
    var error: String? = nil
    var errorColor: Color = Color.red
    var defultKeyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(boarderColor, lineWidth: borderWidth)
                
                TextField(placeHolder, text: $value, onEditingChanged: { isBegin in
                    setupUIState(isFocus: isBegin)
                })
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .foregroundColor(defultTextColor)
                .font(FontManager.sheard.getCustomFont(type: .regular, size: 16))
                .keyboardType(defultKeyboardType)
            }
            .onAppear {
                boarderColor = defultColor
            }
            
            if let error = error {
                Text("1234")
                    .font(FontManager.sheard.getCustomFont(type: .regular, size: 12))
                    .foregroundColor(errorColor)
            }
        }
    }
}

extension InputView {
    func setupUIState(isFocus: Bool) {
        if isFocus {
            state = .focus
            boarderColor = focusColor
        } else {
            if let error = error {
                state = .fail
                boarderColor = errorColor
            } else if value != "" {
                state = .value
                boarderColor = valueColor
            } else {
                state = .value
                boarderColor = defultColor
            }
        }
    }
}

#Preview {
    InputView(value: .constant(""))
}
