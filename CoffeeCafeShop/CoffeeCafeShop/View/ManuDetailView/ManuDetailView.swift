//
//  ManuDetailView.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import SwiftUI

struct ManuDetailView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@StateObject var viewModel = ManuDetailViewModel()
	var imageManuList: [String] = ["black_coffee", "espresso", "americano", "mocha", "capuccino", "latte"]
	var manu: ManuModel = ManuModel(id: "", name: "", image: "", detail: "", type: [])
	
	@State var note: String = ""

    var body: some View {
		ZStack {
			Color(hex: "e9e6df")
				.edgesIgnoringSafeArea(.all)
			
			VStack(spacing: 10) {
				HStack {
					Button(action: {
						presentationMode.wrappedValue.dismiss()
					}, label: {
						Text("BACK")
							.font(FontManager.sheard.getCustomFont(type: .bold, size: 15))
							.foregroundColor(Color(hex: "d9b4ae"))
					})
					
					Spacer()
				}
				
				ScrollView(showsIndicators: false) {
					VStack(alignment: .leading, spacing: 10) {
						Image(imageManuList[Int(viewModel.manu.id) ?? 0])
							.resizable()
							.frame(height: 250)
							.cornerRadius(10)
						
						Text(viewModel.manu.name)
							.font(FontManager.sheard.getCustomFont(type: .bold, size: 25))
							.foregroundColor(Color(hex: "d9b4ae"))
							.multilineTextAlignment(.center)
							.frame(maxWidth: .infinity)
						
						Text(viewModel.manu.detail)
							.font(FontManager.sheard.getCustomFont(type: .regular, size: 16))
							.foregroundColor(Color(hex: "d9b4ae"))
						
						if viewModel.typeList.count != 0 {
							ListTagView(title: "Type", list: $viewModel.typeList, callBack: { name in
								viewModel.getSizeList(nameType: name)
							})
						}
						
						if viewModel.sizeList.count != 0 {
							ListTagView(title: "Size", list: $viewModel.sizeList, callBack: { name in
								viewModel.selectSize(nameSize: name)
							})
						}
						
						if viewModel.sizeList.filter{ $0.isSelect }.count != 0 {
							NoteView(placrHolder: "Note..", note: $note)
								.frame(height: 200)
						}
					}
				}
				
				if viewModel.sizeList.filter{ $0.isSelect }.count != 0 {
					AmountView(amount: $viewModel.amount)
				}
				
				Button(action: {
					// Add Cart
				}, label: {
					ZStack {
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color(hex: "d9b4ae"), lineWidth: 2)
							.frame(height: 40)
						
						Text("Add to Cart")
							.foregroundColor(Color(hex: "d9b4ae"))
							.font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
					}
				})
			}
			.padding(.horizontal, 16)
		}
		.navigationBarBackButtonHidden()
		.onAppear {
			viewModel.manu = manu
			viewModel.getTypeList()
		}
    }
}

//#Preview {
//    ManuDetailView()
//}
