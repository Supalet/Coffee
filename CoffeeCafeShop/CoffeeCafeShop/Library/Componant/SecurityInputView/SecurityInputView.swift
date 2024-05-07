//
//  SecurityInputView.swift
//  CoffeeCafeShop
//
//  Created by Ice on 17/4/2567 BE.
//

import SwiftUI

enum SecurityInputViewState {
    case placeHolder
    case focus
    case value
    case fail
}

struct SecurityInputView: View {
    @State var state: InputViewState = .placeHolder
    @State var boarderColor: Color = Color.black
    @Binding var value: String
    @State var sdsd = ""
    
    @State var isSecurity: Bool = true
    
    var placeHolder: String = "email"
    var cornerRadius: CGFloat = 10
    var borderWidth: CGFloat = 1
    var defultTextColor: Color = Color.black
    var defultColor: Color = Color.black
    var focusColor: Color = Color.red
    var valueColor: Color = Color.black
    var errorMessage: String? = nil
    var errorColor: Color = Color.red
    var defultKeyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(boarderColor, lineWidth: borderWidth)
        
                HStack {
                    if isSecurity {
                        SecureField(placeHolder, text: $value, onCommit: {
                            setupUIState(isFocus: false)
                        })
                        .foregroundColor(defultTextColor)
                        .font(FontManager.sheard.getCustomFont(type: .regular, size: 16))
                        .keyboardType(defultKeyboardType)
                        .onTapGesture {
                            setupUIState(isFocus: true)
                        }
                        
                    } else {
                        TextField(placeHolder, text: $value, onEditingChanged: { isBegin in
                            setupUIState(isFocus: isBegin)
                        })
                        .foregroundColor(defultTextColor)
                        .font(FontManager.sheard.getCustomFont(type: .regular, size: 16))
                        .keyboardType(defultKeyboardType)
                    }
                    
                    Button(action: {
                        value = value
                        isSecurity.toggle()
                    }, label: {
                        Image(systemName: isSecurity ? "eye" : "eye.slash")
                            .foregroundColor(defultColor)
                    })
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
            .onAppear {
                boarderColor = defultColor
            }
            
            if let error = errorMessage {
                Text(error)
                    .font(FontManager.sheard.getCustomFont(type: .regular, size: 12))
                    .foregroundColor(errorColor)
            }
        }
    }
}

extension SecurityInputView {
    func setupUIState(isFocus: Bool) {
        if isFocus {
            state = .focus
            boarderColor = focusColor
        } else {
            if let error = errorMessage {
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
    SecurityInputView(value: .constant(""))
}
