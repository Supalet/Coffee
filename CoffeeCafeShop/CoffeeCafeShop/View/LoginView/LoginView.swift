//
//  LoginView.swift
//  CoffeeCafeShop
//
//  Created by Ice on 15/4/2567 BE.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var viewModel = LoginViewModel()    
    
    var body: some View {
        ZStack {
            Color(hex: "e9e6df")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                VStack(spacing: 5) {
                    Image("tea")
                        .resizable()
                        .frame(width: 180, height: 150)
                    
                    Text("Coffee Shop")
                        .font(FontManager.sheard.getCustomFont(type: .bold, size: 25))
                        .foregroundColor(Color(hex: "d9b4ae"))
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .foregroundColor(Color(hex: "d9b4ae"))
                        .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))

                    InputView(value: $viewModel.usernameValue,
                              placeHolder: "Enter Username",
                              defultTextColor: Color(hex: "d9b4ae"),
                              defultColor: Color(hex: "d9b4ae"),
                              focusColor: Color(hex: "d9b4ae"),
                              valueColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                }
                .padding(.horizontal, 40)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .foregroundColor(Color(hex: "d9b4ae"))
                        .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 20))

                    SecurityInputView(value: $viewModel.passwordValue,
                                      placeHolder: "Enter Password",
                                      defultTextColor: Color(hex: "d9b4ae"),
                                      defultColor: Color(hex: "d9b4ae"),
                                      focusColor: Color(hex: "d9b4ae"),
                                      valueColor: Color(hex: "d9b4ae"))
                        .frame(height: 40)
                }
                .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 20)
                
                VStack(spacing: 10) {
                    Button(action: {
						self.hideKeyboard()
						viewModel.requestLogin {
							self.appRootManager.currentRoot = .home
						}
//						viewModel.navigateToHome.toggle()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "d9b4ae"))
                                .frame(height: 40)
                            
                            Text("Login")
                                .foregroundColor(Color.white)
                                .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
                        }
                    })
                    .padding(.horizontal, 40)
                    
                    Button(action: {
						self.hideKeyboard()
						viewModel.navigateToRegister.toggle()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "d9b4ae"), lineWidth: 2)
                                .frame(height: 40)
                            
                            Text("Register")
                                .foregroundColor(Color(hex: "d9b4ae"))
                                .font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
                        }
                    })
                    .padding(.horizontal, 40)
                }
                
                Spacer()
                
                Text(viewModel.versionApplicationText)
                    .foregroundColor(Color(hex: "d9b4ae"))
                    .font(FontManager.sheard.getCustomFont(type: .regular, size: 16))
                
                NavigationLink(destination: RegisterView(), isActive: $viewModel.navigateToRegister, label: { })
				NavigationLink(destination: ManuView().environmentObject(appRootManager), isActive: $viewModel.navigateToHome, label: { })
            }
            .padding(.top, 80)
//			.opacity(viewModel.opacity)
        }
        .onAppear {
            viewModel.getVersionApplication()
			viewModel.isShowError = false
//			viewModel.opacity = UserManager.shared.dbInfo != nil ? 0 : 1
        }
		.showCustomAler(detail: $viewModel.errorMessage, isShow: $viewModel.isShowError)
		.showSystemLoadings(isShowIndicater: $viewModel.isLoading)
		.onWillDisappear {
//			viewModel.navigateToHome = true
		}
    }
}

#Preview {
    LoginView()
}
