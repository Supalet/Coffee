//
//  CoffeeCafeShopApp.swift
//  CoffeeCafeShop
//
//  Created by Ice on 15/4/2567 BE.
//

import FirebaseCore
import SwiftUI

@main
struct CoffeeCafeShopApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    switch appRootManager.currentRoot {
                    case .launchScreenView:
                        LaunchScreenView()
						
                    case .loginView:
						LoginView()
						
					case .home:
						ManuView()
                    }
                }
                .environmentObject(appRootManager)
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
