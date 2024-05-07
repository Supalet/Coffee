//
//  RegisterView.swift
//  CoffeeCafeShop
//
//  Created by Ice on 16/4/2567 BE.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "e9e6df")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("BACK")
                            .font(FontManager.sheard.getCustomFont(type: .bold, size: 15))
                            .foregroundColor(Color(hex: "d9b4ae"))
                    })
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 10)

                Text("Register")
                    .font(FontManager.sheard.getCustomFont(type: .bold, size: 40))
                    .foregroundColor(Color(hex: "d9b4ae"))
                
                VStack(spacing: 10) {
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Username")
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                            .foregroundColor(Color(hex: "d9b4ae"))
                        
                        InputView(value: $viewModel.username,
                                  placeHolder: "Enter Username",
                                  defultColor: Color(hex: "d9b4ae"),
                                  focusColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                    }
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Email")
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                            .foregroundColor(Color(hex: "d9b4ae"))
                        
                        InputView(value: $viewModel.email,
                                  placeHolder: "Enter Email",
                                  defultColor: Color(hex: "d9b4ae"),
                                  focusColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                    }

                    VStack(alignment: .leading,spacing: 4) {
                        Text("Full Name")
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                            .foregroundColor(Color(hex: "d9b4ae"))
                        
                        InputView(value: $viewModel.name,
                                  placeHolder: "Enter Full Name",
                                  defultColor: Color(hex: "d9b4ae"),
                                  focusColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                    }
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("PhoneNumber")
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                            .foregroundColor(Color(hex: "d9b4ae"))
                        
                        InputView(value: $viewModel.phoneNumber,
                                  placeHolder: "Enter PhoneNumber",
                                  defultColor: Color(hex: "d9b4ae"),
                                  focusColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                    }
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Password")
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                            .foregroundColor(Color(hex: "d9b4ae"))
                        
                        InputView(value: $viewModel.password,
                                  placeHolder: "Enter Password",
                                  defultColor: Color(hex: "d9b4ae"),
                                  focusColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                    }
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Confirm Password")
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))
                            .foregroundColor(Color(hex: "d9b4ae"))
                        
                        InputView(value: $viewModel.confirmPassword,
                                  placeHolder: "Enter Confirm Password",
                                  defultColor: Color(hex: "d9b4ae"),
                                  focusColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.registerMember()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(hex: "d9b4ae"))
                            .frame(height: 40)
                        
                        Text("Register")
                            .foregroundColor(Color.white)
                            .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
                    }
                })

            }
            .padding(.bottom, 10)
            .padding(.horizontal, 16)
            .navigationBarBackButtonHidden()
        }
        .showCustomAler(detail: $viewModel.errorMessage, isShow: $viewModel.isShowError)
		.onAppear {
			viewModel.isShowError = false
		}
    }
}

#Preview {
    RegisterView()
}
