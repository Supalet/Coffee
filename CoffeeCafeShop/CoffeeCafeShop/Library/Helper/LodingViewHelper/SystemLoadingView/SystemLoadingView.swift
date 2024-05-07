//
//  SystemLoadingView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import Foundation
import SwiftUI
import UIKit

struct SystemLoadingView: ViewModifier {
	@Binding var isShow: Bool
	
	func body(content: Content) -> some View {
		ZStack {
			content
			
			BlurView()
				.opacity(isShow ? 0.5 : 0)
				.ignoresSafeArea()
				.onTapGesture {	}
			
			ActivityIndicator(isShow: $isShow,
							  style: .medium)
				.opacity(isShow ? 1 : 0)
				.ignoresSafeArea()
				.frame(width: 50, height: 50)
		}
	}
}

struct ActivityIndicator: UIViewRepresentable {
	@Binding var isShow: Bool
	let style: UIActivityIndicatorView.Style
	
	func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
		return UIActivityIndicatorView(style: style)
	}
	
	func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
		isShow ? uiView.startAnimating() : uiView.stopAnimating()
	}
}
