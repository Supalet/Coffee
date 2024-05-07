//
//  CustomAlert.swift
//  CoffeeCafeShop
//
//  Created by Ice on 18/4/2567 BE.
//

import SwiftUI

struct CustomAlert: ViewModifier {
    @Binding var detail: customAlertModel
    @Binding var isShow: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            BlurView()
                .opacity(isShow ? 0.5 : 0)
                .ignoresSafeArea()
            
            CustomAlertView(detail: $detail, isShow: $isShow)
                .opacity(isShow ? 1 : 0)
        }
    }
}

struct CustomAlertView: View {
    @Binding var detail: customAlertModel
    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 10)  {
                if let title = detail.title {
                    Text(title)
                        .font(FontManager.sheard.getCustomFont(type: .bold, size: 30))
                        .foregroundColor(Color(hex: "d9b4ae"))
                }
                
                if let detailAlert = detail.detail {
                    Text(detailAlert)
                        .font(FontManager.sheard.getCustomFont(type: .regular, size: 20))
                        .foregroundColor(Color(hex: "d9b4ae"))
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                    .frame(height: 10)
                
                HStack(spacing: 10) {
                    if let actionLeft = detail.leftAction {
                        Button(action: {
                            isShow = false
                            actionLeft()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(hex: "d9b4ae"), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                
                                Text(detail.leftTitle ?? "")
                                    .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                                    .foregroundColor(Color(hex: "d9b4ae"))
                            }
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                    }
                    
                    if let actionRight = detail.rightAction {
                        Button(action: {
                            isShow = false
                            actionRight()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "d9b4ae"))
                                
                                Text(detail.rightTitle ?? "")
                                    .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                                    .foregroundColor(Color.white)
                            }
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(20)
			.background(Color.white)
            .cornerRadius(10)
        }
        .padding(.horizontal, 25)
        .shadow(color: Color(hex: "e9e6df"), radius: 1.5)

    }
}

//#Preview {
//    CustomAlertView(isShow: true)
//}
