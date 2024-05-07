//
//  LiftCircleView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import SwiftUI
import UIKit

extension View {
	func onWillDisappear(_ perform: @escaping () -> Void) -> some View {
		self.modifier(WillAppearModifier(callback: perform))
	}
}

struct WillAppearModifier: ViewModifier {
	let callback: () -> Void

	func body(content: Content) -> some View {
		content
			.background(ViewWillAppearHandler(onWillAppear: callback))
	}
}

struct ViewWillAppearHandler: UIViewControllerRepresentable {
	typealias UIViewControllerType = UIViewController
	let onWillAppear: () -> Void
	
	func makeCoordinator() -> ViewWillAppearHandler.Coordinator {
		Coordinator(onWillAppear: onWillAppear)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ViewWillAppearHandler>) -> UIViewController {
		context.coordinator
	}
	
	func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewWillAppearHandler>) {
	}
	
	class Coordinator: UIViewController {
		let onWillAppear: () -> Void
		
		init(onWillAppear: @escaping () -> Void) {
			self.onWillAppear = onWillAppear
			super.init(nibName: nil, bundle: nil)
		}
		
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		override func viewDidLoad() {
			super.viewDidLoad()
			onWillAppear()
		}
		
//		override func viewWillAppear(_ animated: Bool) {
//			super.viewWillAppear(animated)
//			onWillAppear()
//		}
	}
}
