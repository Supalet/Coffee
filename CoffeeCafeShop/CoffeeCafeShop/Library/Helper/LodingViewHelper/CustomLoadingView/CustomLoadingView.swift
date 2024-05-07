//
//  CustomLoadingView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import SDWebImageSwiftUI
import SwiftUI

struct CustomLoadingView: ViewModifier {
	@Binding var isShow: Bool
	
	func body(content: Content) -> some View {
		ZStack {
			content
			
			CustomActivityIndicator(isShow: $isShow)
		}
    }
}

struct CustomActivityIndicator: View {
	@Binding var isShow: Bool
	
	var body: some View {
		AnimatedImage(url: URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjhndnl0ZzY4b2tqYmx5OHN2ZTEybWF0ZW1hbXVoemdwcWZyOXA1ZSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/uIJBFZoOaifHf52MER/giphy.gif"))
	}
}
