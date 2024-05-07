//
//  ManuCell.swift
//  CoffeeCafeShop
//
//  Created by Supalert Kamolsin on 22/4/2567 BE.
//

import SwiftUI

struct ManuCell: View {
	var detail: ManuModel
	var imageManuList: [String] = ["black_coffee", "espresso", "americano", "mocha", "capuccino", "latte"]
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Image(imageManuList[Int(detail.id) ?? 0])
				.resizable()
				.cornerRadius(10)
			
			VStack(alignment: .leading, spacing: 5) {
				Text(detail.name)
					.font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
					.foregroundColor(Color(hex: "d9b4ae"))
					.multilineTextAlignment(.leading)
				
//				HStack {
//					Spacer()
//					
//					Text(detail.price + " บาท")
//						.font(FontManager.sheard.getCustomFont(type: .semiBold, size: 16))
//						.foregroundColor(Color(hex: "d9b4ae"))
//				}
			}
		}
		.padding(.horizontal, 8)
    }
}

//#Preview {
//	ManuCell(detail: ManuModel(id: "0",
//							   name: "B",
//							   image: "",
//							   price: "40",
//							   type: [],
//							   size: []))
//}
