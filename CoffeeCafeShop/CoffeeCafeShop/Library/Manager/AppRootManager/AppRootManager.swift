//
//  AppRootManager.swift
//  CoffeeCafeShop
//
//  Created by Ice on 16/4/2567 BE.
//

import Foundation

final class AppRootManager: ObservableObject {
    @Published var currentRoot: eAppRoots = .launchScreenView
	@Published var isLogin: Bool = UserManager.shared.dbInfo != nil
    
    enum eAppRoots {
        case launchScreenView
        case loginView
		case home
    }
}
