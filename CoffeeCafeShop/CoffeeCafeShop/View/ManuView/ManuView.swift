//
//  ManuView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import SDWebImageSwiftUI
import SwiftUI

struct ManuView: View {
	@EnvironmentObject private var appRootManager: AppRootManager
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@StateObject var viewModel = ManuViewModel()
	
	let columns = [
		GridItem(.flexible(), spacing: 0),
		GridItem(.flexible(), spacing: 0)
	]
	
    var body: some View {
		ZStack {
			Color(hex: "e9e6df")
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				HStack(spacing: 10) {
					Button {
						
					} label: {
						if let image = UserManager.shared.dbInfo?.image {
							WebImage(url: URL(string: image))
								.resizable()
								.frame(width: 30, height: 30)
								.cornerRadius(15)
						}
					}
					
					Text(UserManager.shared.dbInfo?.name ?? "")
						.foregroundColor(Color(hex: "d9b4ae"))
						.font(FontManager.sheard.getCustomFont(type: .regular, size: 16))
					
					Spacer()

					Button {
//						UserManager.shared.dbInfo = nil
//						presentationMode.wrappedValue.dismiss()
						appRootManager.currentRoot = .loginView
					} label: {
						Image(systemName: "cart")
							.resizable()
							.frame(width: 16, height: 16)
							.foregroundColor(Color(hex: "d9b4ae"))
					}
					
//					NavigationLink(destination: ManuDetailView(), isActive: $viewModel.navigateToDetail, label: {})
				}
				.frame(height: 30)
				.frame(maxWidth: .infinity)
				.padding(.horizontal, 16)
				
				GeometryReader(content: { geometry in
					ScrollView(showsIndicators: false) {
						LazyVGrid(columns: columns, content: {
							ForEach(viewModel.manuList, id: \.self) { item in
								NavigationLink (destination: ManuDetailView(manu: item)) {
									ManuCell(detail: item)
										.frame(height: 230)
								}
							}
						})
						.padding(.horizontal, 8)
					}
				})
			}
//			.opacity(viewModel.opacity)
		}
		.navigationBarBackButtonHidden()
		.showCustomAler(detail: $viewModel.errorMessage, isShow: $viewModel.isShowError)
		.showSystemLoadings(isShowIndicater: $viewModel.isLoading)
//		.onWillDisappear {
//			viewModel.navigateToDetail = true
//		}
//		.onAppear {
//			viewModel.opacity = UserManager.shared.dbInfo != nil ? 0 : 1
//		}
    }
}

//#Preview {
//    ManuView()
//}
