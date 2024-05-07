//
//  LaunchScreenView.swift
//  CoffeeCafeShop
//
//  Created by Ice on 15/4/2567 BE.
//

import SDWebImageSwiftUI
import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        ZStack {
            Color(hex: "e9e6df")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5) {
				Image("tea")
					.resizable()
					.frame(width: 100, height: 100)
                
                Text("Coffee Shop")
                    .font(FontManager.sheard.getCustomFont(type: .bold, size: 25))
                    .foregroundColor(Color(hex: "d9b4ae"))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
				appRootManager.currentRoot = UserManager.shared.dbInfo == nil ? .loginView : .home
//				appRootManager.currentRoot = .loginView
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
