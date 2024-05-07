//
//  NavigationUtil.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import UIKit

struct NavigationUtil {
	static func popToRootView(animated: Bool = true) {
		let allScene = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
		let firstScene = allScene.first { $0.isKeyWindow }?.rootViewController
		findNavigationController(viewController: firstScene)?.popToRootViewController(animated: animated)
	}
	
	static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
		guard let viewController = viewController else {
			return nil
		}
		
		if let navigationController = viewController as? UITabBarController {
			return findNavigationController(viewController: navigationController.selectedViewController)
		}
		
		if let navigationController = viewController as? UINavigationController {
			return navigationController
		}
		
		for childViewController in viewController.children {
			return findNavigationController(viewController: childViewController)
		}
		
		return nil
	}
}
