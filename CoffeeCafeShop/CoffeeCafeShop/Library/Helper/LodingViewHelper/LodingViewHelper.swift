//
//  LodingViewHelper.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import SwiftUI

extension View {
	func showSystemLoadings(isShowIndicater: Binding<Bool>) -> some View {
		modifier(SystemLoadingView(isShow: isShowIndicater))
	}
	
	func showCustomLoading(isShowIndicater: Binding<Bool>) -> some View {
		modifier(CustomLoadingView(isShow: isShowIndicater))
	}
}
